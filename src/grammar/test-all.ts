import * as fs from "fs/promises";
import { join } from "path";
import { getParser, Parser } from "./grammar";
import { AstModule, getAstFactory } from "./ast";
import { inspect } from "util";
import { astModule } from "./ast-types.schema";

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
    
};

const log = (obj: unknown) =>
    console.log(inspect(obj, { colors: true, depth: Infinity }));

const main = async () => {
    // await findAllContracts();
    const paths = (await getAllContracts());
    const astFactory = getTestAstFactory();
    const oldParser = parseOrError(getParser(astFactory, "old"));
    const newParser = parseOrError(getParser(astFactory, "new"));

    for (const path of paths) {
        const code = await fs.readFile(path, "utf-8");
        const oldResult = oldParser(code);
        const newResult = newParser(code);
        if (oldResult.type === "ok") {
            if (newResult.type === "ok") {
                const [areMatching, errors] = astModule.eq(oldResult.ast, newResult.ast)([]);
                if (!areMatching) {
                    console.log('!!!', path, 'AST mismatch');
                    log(errors);
                    console.log('');
                }
            } else {
                console.log('!!!', path, `Stopped parsing`);
                console.log('');
            }
        } else {
            if (newResult.type === "ok") {
                console.log('!!!', path, `Started parsing`);
                console.log('');
            } else {
                if (oldResult.error !== newResult.error) {
                    console.log('!!!', path, `Errors differ`);
                    console.log(oldResult.error);
                    console.log(newResult.error);
                    console.log('');
                }
            }
        }
    }
};

void main();
