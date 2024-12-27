import fs from "fs";
import { prettyPrint } from "../prettyPrinter";
import { getParser } from "../grammar";
import { getAstFactory } from "../grammar/ast";
import { defaultParser } from "../grammar/grammar";
import { astModule } from "../grammar/ast-types.schema";
import { inspect } from 'util';

const log = (obj: unknown) => console.log(inspect(obj, { colors: true, depth: Infinity }));

const Ast = getAstFactory();
const { parse } = getParser(Ast, defaultParser);
const filePath = '/home/user/Documents/work/tact2/src/test/contracts/attributes.tact';
const src = fs.readFileSync(filePath, "utf-8");
const ast = parse(src, filePath, "user");

const formatted = prettyPrint(ast);

const astFormatted = parse(formatted, filePath, "user");

// (5) ['.items', '[0]', '.attributes', '[0]', '.methodId']
// log(astFormatted);
// debugger;
console.log(astModule.eq(astFormatted, ast)([]));