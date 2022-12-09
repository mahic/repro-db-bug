using Microsoft.AspNetCore.DataProtection;

namespace repro
{
  public class Startup
  {
    public Startup(IWebHostEnvironment env, IConfiguration configuration)
    {
    }

    public void ConfigureServices(IServiceCollection services)
    {
      services.AddDataProtection().PersistKeysToFileSystem(new DirectoryInfo(@"/data"));
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
    }
  }
}
