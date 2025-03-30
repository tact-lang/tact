import type { TypeDecl as AstTypeDecl } from "../../src/ast/ast";
import { nextId } from "./id";

import * as path from "path";
import files from "../../src/stdlib/stdlib";
import { createVirtualFileSystem } from "../../src/vfs/createVirtualFileSystem";
import { dummySrcInfoPrintable, generateAstIdFromName } from "./util";

const StdlibFilePath = path.join(
    __dirname,
    "..",
    "..",
    "src",
    "stdlib",
    "stdlib",
);
const StdlibVFS = createVirtualFileSystem(StdlibFilePath, files);
export const StdlibPath = StdlibVFS.resolve("std/stdlib.fc");
export const StdlibCode = StdlibVFS.readFile(StdlibPath).toString();
// export const StdlibExPath = StdlibVFS.resolve("std/stdlib_ex.fc");
// export const StdlibExCode = StdlibVFS.readFile(StdlibExPath).toString();

/**
 * Returns traits defined in stdlib.
 * TODO: We should parse its sources instead
 */
export function getStdlibTraits(): AstTypeDecl[] {
    return [
        {
            kind: "trait",
            id: nextId(),
            name: generateAstIdFromName("BaseTrait"),
            traits: [],
            attributes: [],
            declarations: [],
            loc: dummySrcInfoPrintable,
        },
    ];
}
