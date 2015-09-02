var description = {
  summary: "Frontend Checkmark",
  version: "1.0.0",
  name: "checkmark"
};
Package.describe(description);

var path = Npm.require("path");
var fs = Npm.require("fs");
eval(fs.readFileSync("./packages/autopackage.js").toString());
Package.onUse(function(api) {
  addFiles(api, description.name, getDefaultProfiles());
  api.use(["foundation"]);
  api.export([
    "Checkmarks",
    "CheckmarkPreSave",
    "CheckmarksHandle"
  ])
});
