#!/usr/bin/env ts-node
import fc from "fast-check";
import { randomAstExpression } from "./random.infra";
import { prettyPrint } from "./ast-printer";

const args = process.argv.slice(2);
if (args.length !== 1) {
    console.error("Usage: yarn random-ast <count>");
    process.exit(1);
}

const count = parseInt(args[0] ?? "", 10);
if (isNaN(count) || count <= 0) {
    console.error("Error: Count must be a positive integer");
    process.exit(1);
}

fc.sample(randomAstExpression("+1"), count).forEach((expression, index) => {
    console.log(`Expression ${index + 1}:`);
    console.log(prettyPrint(expression));
    console.log("-".repeat(80));
});
