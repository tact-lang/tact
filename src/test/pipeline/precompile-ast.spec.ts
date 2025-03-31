import path from "path";
import type * as A from "@/ast/ast";
import { getAstFactory } from "@/ast/ast-helpers";
import { CompilerContext } from "@/context/context";
import { precompile } from "@/pipeline/precompile";
import files from "@/stdlib/stdlib";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import fs from "fs";
import { getParser } from "@/grammar";
import { getMakeAst } from "@/ast/generated/make-factory";
import type { MakeAstFactory } from "@/ast/generated/make-factory";

// This function manually creates a module containing a contract with a reference to StateInit in its single field.
// StateInit is declared in stdlib.
//
// contract Test {
//    f: StateInit;
//
//    init() {
//        self.f = initOf Test();
//    }
// }

function makeModule(mF: MakeAstFactory): A.Module {
    // The contract field
    const field = mF.makeDummyFieldDecl(
        mF.makeDummyId("f"),
        mF.makeDummyTypeId("StateInit"),
        undefined,
        undefined,
    );
    // The contract init function
    const initOfExpr = mF.makeDummyInitOf(mF.makeDummyId("Test"), []);
    const path = mF.makeDummyFieldAccess(
        mF.makeDummyId("self"),
        mF.makeDummyId("f"),
    );
    const assignStmt = mF.makeDummyStatementAssign(path, initOfExpr);
    const init = mF.makeDummyContractInit([], [assignStmt]);

    // The contract
    const contract = mF.makeDummyContract(
        mF.makeDummyId("Test"),
        [],
        [],
        undefined,
        [field, init],
    );

    return mF.makeModule([], [contract]);
}

describe("pre-compilation of ASTs", () => {
    const astF = getAstFactory();
    const mF = getMakeAst(astF);

    it("should pass pre-compilation of AST with references to stdlib", () => {
        const ctx = new CompilerContext();

        // An empty tact file is required so that pre-compile does not complain about
        // non-existence of an entry point.
        const fileSystem = {
            ["empty.tact"]: "",
        };

        const project = createVirtualFileSystem("/", fileSystem, false);
        const stdlib = createVirtualFileSystem("@stdlib", files);
        const parser = getParser(astF);

        precompile(ctx, project, stdlib, "empty.tact", parser, astF, [
            makeModule(mF),
        ]);
    });

    it("should pass pre-compilation with no manual AST", () => {
        const ctx = new CompilerContext();

        // The dummy.tact file contains exactly the same declarations
        // carried out by the function makeModule()
        const fileSystem = {
            ["dummy.tact"]: fs
                .readFileSync(path.join(__dirname, "dummy.tact"))
                .toString("base64"),
        };

        const project = createVirtualFileSystem("/", fileSystem, false);
        const stdlib = createVirtualFileSystem("@stdlib", files);
        const parser = getParser(astF);

        precompile(ctx, project, stdlib, "dummy.tact", parser, astF, []);
    });

    it("should fail pre-compilation when source files and a manual AST have declaration clashes", () => {
        const ctx = new CompilerContext();

        // The dummy.tact file contains exactly the same declarations
        // carried out by the function makeModule()
        const fileSystem = {
            ["dummy.tact"]: fs
                .readFileSync(path.join(__dirname, "dummy.tact"))
                .toString("base64"),
        };

        const project = createVirtualFileSystem("/", fileSystem, false);
        const stdlib = createVirtualFileSystem("@stdlib", files);
        const parser = getParser(astF);

        // So, a clash should occur here, since dummy.tact and makeModule() both declare the contract Test.
        expect(() =>
            precompile(ctx, project, stdlib, "dummy.tact", parser, astF, [
                makeModule(mF),
            ]),
        ).toThrowErrorMatchingSnapshot();
    });
});
