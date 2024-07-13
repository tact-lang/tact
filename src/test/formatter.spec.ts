import fs from "fs";
import { __DANGER_resetNodeId } from "../grammar/ast";
import {formatAst} from "../formatter"
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
            const formatted = formatAst(ast)
            expect(formatted).toEqual(src)
    })
    it.each(fs.readdirSync(__dirname + "/formatting/proper/"))
    ("souldn't change AST",
        (file) => {
            const folderPathProper = join(__dirname, "formatting", "proper")
            const filePath = join(folderPathProper, file)
            const src = fs.readFileSync(filePath, "utf-8")
            const ast = parse(src, filePath, "user")
            //TODO: change for proper recursive removal
            const astStr = JSONBig.stringify(ast).replace(/"id":[0-9]+,/g, "")

            const formatted = formatAst(ast)
            const folderPathOutput = join(__dirname, "formatting", "output")
            if (!fs.existsSync(folderPathOutput)) {
                fs.mkdirSync(folderPathOutput)
            }
            const filePathOutput = join(folderPathOutput, file)
            fs.openSync(filePathOutput, 'w')
            fs.writeFileSync(filePathOutput, formatted, {flag: 'w'})
            const astFormatted = parse(formatted, filePathOutput, "user")
            //TODO: change for proper recursive removal
            const astFormattedStr = JSONBig.stringify(astFormatted).replace(/"id":[0-9]+,/g, "")
            expect(astFormattedStr).toEqual(astStr)
    })
})