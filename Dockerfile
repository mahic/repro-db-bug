FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source

COPY src/webapp/webapp.csproj .
RUN dotnet restore -r linux-x64

COPY src/webapp/. .
RUN dotnet publish -c Release -r linux-x64 -o /app --no-restore --no-self-contained

FROM mcr.microsoft.com/dotnet/nightly/aspnet:7.0-jammy-chiseled AS base

EXPOSE 80

FROM base AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "webapp.dll"]