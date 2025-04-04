import type * as Ast from "@/ast/ast";
import * as fc from "fast-check";
import * as fs from "fs";
import { Scope } from "@/test/fuzzer/src/scope";
import { SUPPORTED_STDLIB_TYPES } from "@/test/fuzzer/src/types";
import type { Type } from "@/test/fuzzer/src/types";
import {
    Expression,
    NonGenerativeExpressionParams,
} from "@/test/fuzzer/src/generators";
import path from "path";

/**
 * AST utility functions
 */

function getHeight(tree: Ast.Expression): number {
    switch (tree.kind) {
        case "address":
        case "boolean":
        case "cell":
        case "id":
        case "null":
        case "number":
        case "string":
        case "slice":
        case "code_of":
            return 0;
        case "init_of": {
            const children = tree.args.map((arg) => getHeight(arg));
            return children.length === 0 ? 0 : Math.max(...children) + 1;
        }
        case "field_access":
            return getHeight(tree.aggregate) + 1;
        case "conditional":
            return (
                Math.max(
                    getHeight(tree.condition),
                    getHeight(tree.thenBranch),
                    getHeight(tree.elseBranch),
                ) + 1
            );
        case "method_call":
            return (
                Math.max(
                    getHeight(tree.self),
                    ...tree.args.map((arg) => getHeight(arg)),
                ) + 1
            );
        case "static_call": {
            const children = tree.args.map((arg) => getHeight(arg));
            return children.length === 0 ? 0 : Math.max(...children) + 1;
        }
        case "struct_instance": {
            const children = tree.args.map((init) =>
                getHeight(init.initializer),
            );
            return children.length === 0 ? 0 : Math.max(...children) + 1;
        }
        case "struct_value": {
            const children = tree.args.map((init) =>
                getHeight(init.initializer),
            );
            return children.length === 0 ? 0 : Math.max(...children) + 1;
        }
        case "op_unary":
            return getHeight(tree.operand) + 1;
        case "op_binary":
            return Math.max(getHeight(tree.left), getHeight(tree.right)) + 1;
    }
}

function countNodes(tree: Ast.Expression): number {
    switch (tree.kind) {
        case "address":
        case "boolean":
        case "cell":
        case "id":
        case "null":
        case "number":
        case "string":
        case "slice":
        case "code_of":
            return 1;
        case "init_of":
            return sum(tree.args.map((arg) => countNodes(arg))) + 1;
        case "field_access":
            return countNodes(tree.aggregate) + 1;
        case "conditional":
            return (
                countNodes(tree.condition) +
                countNodes(tree.thenBranch) +
                countNodes(tree.elseBranch) +
                1
            );
        case "method_call":
            return (
                countNodes(tree.self) +
                sum(tree.args.map((arg) => countNodes(arg))) +
                1
            );
        case "static_call":
            return sum(tree.args.map((arg) => countNodes(arg))) + 1;
        case "struct_instance":
            return (
                sum(tree.args.map((init) => countNodes(init.initializer))) + 1
            );
        case "struct_value":
            return (
                sum(tree.args.map((init) => countNodes(init.initializer))) + 1
            );
        case "op_unary":
            return countNodes(tree.operand) + 1;
        case "op_binary":
            return countNodes(tree.left) + countNodes(tree.right) + 1;
    }
}

function sum(items: number[]): number {
    return items.reduce((prev, curr) => prev + curr, 0);
}

function preorderTraversal(tree: Ast.Expression, accumulator: string[]) {
    switch (tree.kind) {
        case "address":
        case "boolean":
        case "cell":
        case "id":
        case "null":
        case "number":
        case "string":
        case "slice":
        case "code_of": {
            accumulator.push(tree.kind);
            break;
        }
        case "init_of": {
            accumulator.push(tree.kind + "_" + tree.contract.text);
            tree.args.forEach((arg) => {
                preorderTraversal(arg, accumulator);
            });
            break;
        }
        case "field_access": {
            accumulator.push(tree.kind);
            preorderTraversal(tree.aggregate, accumulator);
            break;
        }
        case "conditional": {
            accumulator.push(tree.kind);
            preorderTraversal(tree.condition, accumulator);
            preorderTraversal(tree.thenBranch, accumulator);
            preorderTraversal(tree.elseBranch, accumulator);
            break;
        }
        case "method_call": {
            accumulator.push(tree.kind + "_" + tree.method.text);
            preorderTraversal(tree.self, accumulator);
            tree.args.forEach((arg) => {
                preorderTraversal(arg, accumulator);
            });
            break;
        }
        case "static_call": {
            accumulator.push(tree.kind + "_" + tree.function.text);
            tree.args.forEach((arg) => {
                preorderTraversal(arg, accumulator);
            });
            break;
        }
        case "struct_instance": {
            accumulator.push(
                tree.kind + "_" + tree.args.length + "_" + tree.type.text,
            );
            tree.args.forEach((arg) => {
                preorderTraversal(arg.initializer, accumulator);
            });
            break;
        }
        case "struct_value": {
            accumulator.push(
                tree.kind + "_" + tree.args.length + "_" + tree.type.text,
            );
            tree.args.forEach((arg) => {
                preorderTraversal(arg.initializer, accumulator);
            });
            break;
        }
        case "op_unary": {
            accumulator.push(tree.kind + "_" + tree.op);
            preorderTraversal(tree.operand, accumulator);
            break;
        }
        case "op_binary": {
            accumulator.push(tree.kind + "_" + tree.op);
            preorderTraversal(tree.left, accumulator);
            preorderTraversal(tree.right, accumulator);
            break;
        }
    }
}

function incrementKey<K>(
    key: K,
    map: Map<K, TreeStats>,
    height: number,
    size: number,
) {
    const value = map.get(key);
    if (value) {
        const newVal = {
            count: value.count + 1,
            height: value.height,
            size: value.size,
        };
        map.set(key, newVal);
    } else {
        map.set(key, {
            count: 1,
            height,
            size,
        });
    }
}

type TreeStats = {
    count: number;
    height: number;
    size: number;
};

function getRows<K>(dist: Map<K, TreeStats>): string[] {
    const rows: string[] = [];
    for (const [_, stats] of dist) {
        rows.push(`${stats.count} ${stats.height} ${stats.size}`);
    }
    return rows;
}

function statistics(
    gen: fc.Arbitrary<Ast.Expression>,
    numberOfSamples: number,
    fileName: string,
) {
    const trees = fc.sample(gen, numberOfSamples);

    const totalPreTraversals: Map<string, TreeStats> = new Map();

    for (const tree of trees) {
        const preTraversal: string[] = [];
        preorderTraversal(tree, preTraversal);
        const treeName = preTraversal.join("@");
        const height = getHeight(tree);
        const size = countNodes(tree);
        incrementKey(treeName, totalPreTraversals, height, size);
    }

    fs.writeFileSync(
        fileName,
        `count height size\n${getRows(totalPreTraversals).join("\n")}`,
    );
}

function main() {
    const globalScope = new Scope("program", undefined);
    const generator = fc
        .constantFrom(...SUPPORTED_STDLIB_TYPES)
        .chain((type) => {
            const ty: Type = { kind: "stdlib", type };
            return new Expression(
                globalScope,
                ty,
                NonGenerativeExpressionParams,
            ).generate();
        });
    statistics(generator, 50000, path.join(__dirname, "counts.txt"));
}

main();
