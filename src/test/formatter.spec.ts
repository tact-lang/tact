import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import {formatAST} from "../formatter"
import { parse } from "../grammar/grammar";
import {join} from 'path';
import JSONBig from 'json-bigint'

describe("formatter", () => {
    it.each(fs.readdirSync(join(__dirname, "formatting" , "proper")))
    ("shouldn't change proper formatting", 
        (file) =>{
            const filePath = join(__dirname, "formatting" , "proper", file)
            const src = fs.readFileSync(filePath, "utf-8")
            const ast = parse(src, filePath, "user")
            const formatted = formatAST(ast)
            expect(formatted).toEqual(src)
    })
    it.each(fs.readdirSync(__dirname + "/formatting/proper/"))
    ("souldn't change AST",
        (file) => {
            const filePath = __dirname + "/formatting/proper/" + file
            const src = fs.readFileSync(filePath, "utf-8")
            const ast = parse(src, filePath, "user")
            //TODO: change for proper recursive removal
            const astStr = JSONBig.stringify(ast).replace(/"id":[0-9]+,/g, "")

            const formatted = formatAST(ast)
            fs.openSync(join(__dirname, "formatting", "output", file), 'w')
            fs.writeFileSync(join(__dirname, "formatting", "output", file), formatted, {flag: 'w'})
            const astFormatted = parse(formatted, __dirname + "/formatting/output/" + file, "user")
            //TODO: change for proper recursive removal
            const astFormattedStr = JSONBig.stringify(astFormatted).replace(/"id":[0-9]+,/g, "")
            expect(astFormattedStr).toEqual(astStr)
    })
})