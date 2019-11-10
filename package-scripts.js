
function test(params) {
  return `mocha ${params}`;
}

module.exports = {
  scripts: {
    default: {
      script: "node scripts/start.js",
      description: "Start app",
    },
    lint: {
      default: {
        script: "nps lint.code",
        description: "Default lint"
      },
      code: {
        script: "eslint .",
        description: "Lint for code",
      },
    },
    test: {
      default: {
        script: `nps ${[
          "test.unit",
          "test.integration",
        ].join(" ")}`
      },
      unit: {
        script: test("test/unit/*.spec.js"),
        description: "Unit test",
      },
      integration: {
        script: test("test/integration/*.spec.js"),
        description: "Integration test",
      },
    },
  }
};
