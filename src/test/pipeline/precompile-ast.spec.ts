import path from "path";
import type * as A from "../../ast/ast";
import { getAstFactory } from "../../ast/ast-helpers";
import { CompilerContext } from "../../context/context";
import { defaultParser, getParser } from "../../grammar/grammar";
import { precompile } from "../../pipeline/precompile";
import files from "../../stdlib/stdlib";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import fs from "fs";
import { getSrcInfo } from "../../grammar/src-info";

describe("pre-compilation of ASTs", () => {
    const astF = getAstFactory();
    // Using dummySrcInfo causes internal compiler error. So, just use this with a blank empty source, since there is no source file.
    const emptySrcInfo = getSrcInfo(" ", 0, 0, null, "user");

    // This function manually creates a module containing a contract with a reference to StateInit in its single field.
    // StateInit is declared in stdlib.
    //
    // contract Test {
    //    f: StateInit
    //
    //    init() {
    //        self.f = initOf Test();
    //    }
    // }

    function makeModule(): A.AstModule {
        return astF.createNode({
            kind: "module",
            imports: [],
            items: [makeContract()],
        }) as A.AstModule;
    }

    function makeId(name: string): A.AstId {
        return astF.createNode({
            kind: "id",
            text: name,
            loc: emptySrcInfo,
        }) as A.AstId;
    }

    function makeTypeId(name: string): A.AstTypeId {
        return astF.createNode({
            kind: "type_id",
            text: name,
            loc: emptySrcInfo,
        }) as A.AstTypeId;
    }

    function makeInitOf(
        contract: A.AstId,
        args: A.AstExpression[],
    ): A.AstInitOf {
        return astF.createNode({
            kind: "init_of",
            args,
            contract,
            loc: emptySrcInfo,
        }) as A.AstInitOf;
    }

    function makeAssignStatement(
        path: A.AstExpression,
        expr: A.AstExpression,
    ): A.AstStatementAssign {
        return astF.createNode({
            kind: "statement_assign",
            path: path,
            expression: expr,
            loc: emptySrcInfo,
        }) as A.AstStatementAssign;
    }

    function makeFieldAccess(
        aggregate: A.AstExpression,
        field: A.AstId,
    ): A.AstFieldAccess {
        return astF.createNode({
            kind: "field_access",
            aggregate,
            field,
            loc: emptySrcInfo,
        }) as A.AstFieldAccess;
    }

    function makeContractField(
        name: A.AstId,
        type: A.AstTypeId,
        expr: A.AstExpression | undefined,
    ): A.AstFieldDecl {
        return astF.createNode({
            kind: "field_decl",
            name,
            type,
            as: undefined,
            initializer: expr,
            loc: emptySrcInfo,
        }) as A.AstFieldDecl;
    }

    function makeContractInit(): A.AstContractInit {
        const initOfExpr = makeInitOf(makeId("Test"), []);
        const path = makeFieldAccess(makeId("self"), makeId("f"));
        const assignStmt = makeAssignStatement(path, initOfExpr);
        return astF.createNode({
            kind: "contract_init",
            params: [],
            statements: [assignStmt],
            loc: emptySrcInfo,
        }) as A.AstContractInit;
    }

    function makeContract(): A.AstContract {
        const field = makeContractField(
            makeId("f"),
            makeTypeId("StateInit"),
            undefined,
        );
        const init = makeContractInit();
        return astF.createNode({
            kind: "contract",
            name: makeId("Test"),
            params: undefined,
            traits: [],
            attributes: [],
            declarations: [field, init],
            loc: emptySrcInfo,
        }) as A.AstContract;
    }

    it("should pass pre-compilation of AST with references to stdlib", () => {
        const ctx = new CompilerContext();

        // An empty tact file is required so that pre-compile does not complain about
        // non-existence of an entry point.
        const fileSystem = {
            ["empty.tact"]: fs
                .readFileSync(path.join(__dirname, "empty.tact"))
                .toString("base64"),
        };

        const project = createVirtualFileSystem("/", fileSystem, false);
        const stdlib = createVirtualFileSystem("@stdlib", files);
        const parser = getParser(astF, defaultParser);

        precompile(ctx, project, stdlib, "empty.tact", parser, astF, [
            makeModule(),
        ]);
    });
});
