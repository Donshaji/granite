import "../stylesheets/application.scss";

const componentRequireContext = require.context("src", true);

const { setAuthHeaders } = require("apis/axios");
const { initializeLogger } = require("common/logger");

initializeLogger();
setAuthHeaders();

const ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
