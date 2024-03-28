/* eslint-env node */
module.exports = {
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    sourceType: "module",
    ecmaVersion: 2020,
    project: "./tsconfig.eslint.json",
  },
  ignorePatterns: ["*.cjs"],
  plugins: ['@typescript-eslint'],
  root: true,
  env: {
    node: true,
    es2021: true,
  },
  rules: {
    '@typescript-eslint/no-unused-vars': [
      'error',
      {
        "argsIgnorePattern": "^_",
        "varsIgnorePattern": "^_",
        "caughtErrorsIgnorePattern": "^_"
      }
    ],
    "@typescript-eslint/no-var-requires": ['error',
      { 
        allow: ['/package\\.json$']
      }
    ],
    "@typescript-eslint/no-duplicate-type-constituents": "error",
  },
};
