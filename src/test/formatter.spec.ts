import fs from "fs";
import { CompilerContext } from "../context";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { loadCases } from "../utils/loadCases";
import { precompile } from "../pipeline/precompile";
import { createNodeFileSystem } from "../vfs/createNodeFileSystem";
import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import files from "../imports/stdlib";
import { getRawAST, parsePrograms } from "../grammar/store";
import {formatAST} from "../formatter"
import { parse } from "../grammar/grammar";

describe("formatter", () => {
    it.each(fs.readdirSync(__dirname + "/formatting/proper/"))
    ("shouldn't change proper formatting", 
        (file) =>{

            const filePath = __dirname + "/formatting/proper/" + file
            const src = fs.readFileSync(filePath, "utf-8")
            const ast = parse(src, filePath, "user")
            const formatted = formatAST(ast)
            expect(formatted).toEqual(src)
    })
})