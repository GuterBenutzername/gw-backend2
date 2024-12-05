{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  languages.javascript = {
    enable = true;
    pnpm.enable = true;
  };

  services.postgres = {
    enable = true;
    initialDatabases = [
      {
        name = "gw";
        schema = ./initial_migration.sql;
      }
    ];
  };

}
