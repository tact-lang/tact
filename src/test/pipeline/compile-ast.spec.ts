import type * as Ast from "@/ast/ast";
import { getAstFactory } from "@/ast/ast-helpers";
import { CompilerContext } from "@/context/context";
import { precompile } from "@/pipeline/precompile";
import files from "@/stdlib/stdlib";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import type { MakeAstFactory } from "@/ast/generated/make-factory";
import { getMakeAst } from "@/ast/generated/make-factory";
import type { BuildContext } from "@/pipeline/build";
import { Logger } from "@/context/logger";
import { compileFunc, compileTact } from "@/pipeline/compile";
import { AssemblyWriter, disassembleRoot } from "@tact-lang/opcode";
import { Cell } from "@ton/core";

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

function makeModule(mF: MakeAstFactory): Ast.Module {
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

describe("compilation of ASTs", () => {
    const astF = getAstFactory();
    const mF = getMakeAst(astF);

    it("should compile AST to BoC", async () => {
        const contractAst = makeModule(mF);
        const codeBoc = await compileModule(contractAst, "Test");

        if (!codeBoc) {
            fail("Cannot compile FunC");
        }

        const codeFiftDecompiled = decompileCell(codeBoc);

        expect(codeBoc.toString("hex")).toMatchSnapshot();
        expect(codeFiftDecompiled).toMatchSnapshot();
    });

    async function compileModule(
        contractAst: Ast.Module,
        contractName: string,
    ) {
        const fileSystem = { ["dummy.tact"]: "" };

        const project = createVirtualFileSystem("/", fileSystem, false);
        const stdlib = createVirtualFileSystem("@stdlib", files);

        let ctx = new CompilerContext();
        ctx = precompile(ctx, project, stdlib, "dummy.tact", [contractAst]);

        const bCtx: BuildContext = {
            config: {
                name: "test",
                path: "",
                mode: "full",
                output: "./out",
            },
            logger: new Logger(),
            project,
            stdlib,
            ctx,
            compilerInfo: "",
            built: {},
            errorMessages: [],
        };

        const compileRes = await compileTact(bCtx, contractName);
        if (!compileRes) {
            fail(`Tact compiler failed`);
        }

        return await compileFunc(
            bCtx,
            contractName,
            compileRes.entrypointPath,
            compileRes.funcSource,
        );
    }

    function decompileCell(codeBoc: Buffer) {
        const cell = Cell.fromBoc(codeBoc).at(0);
        if (typeof cell === "undefined") {
            fail("Cannot create Cell from BoC file");
        }

        const program = disassembleRoot(cell, { computeRefs: true });
        return AssemblyWriter.write(program, {
            useAliases: true,
        });
    }
});
