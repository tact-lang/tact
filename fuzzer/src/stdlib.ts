import { AstTypeDecl } from "../../src/ast/ast";
import { nextId } from "./id";

import * as path from "path";
import files from "../../src/stdlib/stdlib";
import { createVirtualFileSystem } from "../../src/vfs/createVirtualFileSystem";
import { generateAstIdFromName } from "./util";
import { dummySrcInfo } from "../../src/grammar/";

// const StdlibFilePath = path.join(__dirname, "..", "..", "src", "stdlib", "stdlib", "std");
// const StdlibVFS = createVirtualFileSystem(StdlibFilePath, files);
// export const StdlibPath = StdlibVFS.resolve("stdlib.fc");
// export const StdlibCode = StdlibVFS.readFile(StdlibPath).toString();
// export const StdlibExPath = StdlibVFS.resolve("stdlib_ex.fc");
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
      loc: dummySrcInfo,
    },
  ];
}
