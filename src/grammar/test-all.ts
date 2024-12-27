import * as fs from "fs/promises";
import { join } from "path";
import { getParser, Parser } from "./grammar";
import { AstModule, getAstFactory } from "./ast";
import { AstComparator } from "./compare";
import { inspect } from "util";

const contractListFile = join(__dirname, "contracts.json");

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const findAllContracts = async () => {
    const files: string[] = [];
    for await (const file of fs.glob("/home/user/repos/**/*.tact")) {
        if (!file.includes("node_modules")) {
            console.log(file);
            files.push(file);
        }
    }
    await fs.writeFile(
        contractListFile,
        JSON.stringify(files, null, 4),
        "utf-8",
    );
};

const getAllContracts = async () => {
    const text = await fs.readFile(contractListFile, "utf-8");
    const contracts: string[] = JSON.parse(text);
    return contracts;
};

const getTestAstFactory: typeof getAstFactory = () => {
    const nextId = 0;
    return {
        createNode: (src) => Object.freeze(Object.assign({ id: nextId }, src)),
        cloneNode: (src) => ({ ...src, id: nextId }),
    };
};

type Result = ResultSuccess | ResultError;
type ResultSuccess = { readonly type: "ok"; readonly ast: AstModule };
type ResultError = { readonly type: "error"; readonly error: string };

const parseOrError =
    (parser: Parser) =>
    (code: string): Result => {
        try {
            return {
                type: "ok",
                ast: parser.parse(code, "source", "user"),
            };
        } catch (e) {
            return {
                type: "error",
                error: (e as any).toString(),
            };
        }
    };

const makeComparator = () => {
    const comparator = AstComparator.make({
        sort: false,
        canonicalize: false,
    });

    return (result1: Result, result2: Result): boolean => {
        return (
            (result1.type === "ok" &&
                result2.type === "ok" &&
                comparator.compare(result1.ast, result2.ast)) ||
            (result1.type === "error" &&
                result2.type === "error" &&
                result1.error === result2.error)
        );
    };
};

const log = (obj: unknown) =>
    console.log(inspect(obj, { colors: true, depth: Infinity }));

const main = async () => {
    // await findAllContracts();
    const paths = (await getAllContracts()).slice(0, 5);
    const astFactory = getTestAstFactory();
    const oldParser = parseOrError(getParser(astFactory, "old"));
    const newParser = parseOrError(getParser(astFactory, "new"));
    const compare = makeComparator();

    for (const path of paths) {
        const code = await fs.readFile(path, "utf-8");
        const oldResult = oldParser(code);
        const newResult = newParser(code);
        const areSame = compare(oldResult, newResult);
        if (!areSame) {
            console.log(`Mismatch in ${path}`);
            log(oldResult);
            log(newResult);
            console.log("");
        }
    }
};

void main();
