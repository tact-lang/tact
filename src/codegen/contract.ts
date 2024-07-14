import { getAllTypes } from "../types/resolveDescriptors";
import { TypeDescription } from "../types/types";
import { getSortedTypes } from "../storage/resolveAllocation";
import { FuncAstModule, FuncAstComment } from "../func/syntax";
import { makeComment, makePragma, makeInclude } from "../func/syntaxUtils";
import { FunctionGen, CodegenContext } from ".";

/**
 * Func version used to compile the generated code.
 */
export const CODEGEN_FUNC_VERSION = "0.4.4";

/**
 * Encapsulates generation of Func contracts from the Tact contract.
 */
export class ContractGen {
    private constructor(
        private ctx: CodegenContext,
        private contractName: string,
        private abiName: string,
    ) {}

    static fromTact(
        ctx: CodegenContext,
        contractName: string,
        abiName: string,
    ): ContractGen {
        return new ContractGen(ctx, contractName, abiName);
    }

    private addPragmas(m: FuncAstModule): void {
        m.entries.push(makePragma(`version =${CODEGEN_FUNC_VERSION}`));
        m.entries.push(makePragma("allow-post-modification"));
        m.entries.push(makePragma("compute-asm-ltr"));
    }

    private addIncludes(m: FuncAstModule): void {
        m.entries.push(makeInclude(`${this.abiName}.headers.fc`));
        m.entries.push(makeInclude(`${this.abiName}.stdlib.fc`));
        m.entries.push(makeInclude(`${this.abiName}.storage.fc`));
    }

    /**
     * Adds stdlib definitions to the generated module.
     */
    private addStdlib(m: FuncAstModule): void {
        // TODO
    }

    private addSerializers(m: FuncAstModule): void {
        const sortedTypes = getSortedTypes(this.ctx.ctx);
        for (const t of sortedTypes) {
        }
    }

    private addAccessors(m: FuncAstModule): void {
        // TODO
    }

    private addInitSerializer(m: FuncAstModule): void {
        // TODO
    }

    private addStorageFunctions(m: FuncAstModule): void {
        // TODO
    }

    private addStaticFunctions(m: FuncAstModule): void {
        // TODO
    }

    private addExtensions(m: FuncAstModule): void {
        // TODO
    }

    /**
     * Adds functions defined within the Tact contract to the generated Func module.
     * TODO: Why do we need function from *all* the contracts?
     */
    private addContractFunctions(m: FuncAstModule, c: TypeDescription): void {
        m.entries.push(makeComment("", `Contract ${c.name} functions` ,""));

        // TODO: Generate init

        for (const tactFun of c.functions.values()) {
            const funcFun = FunctionGen.fromTact(this.ctx).writeFunction(
                tactFun,
            );
            m.entries.push(funcFun);
        }
    }

    private addMain(m: FuncAstModule): void {
        // TODO
    }

    /**
     * Adds a comment entry to the module.
     */
    private addComment(m: FuncAstModule, c: FuncAstComment): void {
        m.entries.push(c);
    }

    public writeProgram(): FuncAstModule {
        const m: FuncAstModule = { kind: "module", entries: [] };

        const allTypes = Object.values(getAllTypes(this.ctx.ctx));
        const contracts = allTypes.filter((v) => v.kind === "contract");
        const contract = contracts.find((v) => v.name === this.contractName);
        if (contract === undefined) {
            throw Error(`Contract "${this.contractName}" not found`);
        }

        this.addPragmas(m);
        this.addIncludes(m);
        this.addStdlib(m);
        this.addSerializers(m);
        this.addAccessors(m);
        this.addInitSerializer(m);
        this.addStorageFunctions(m);
        this.addStaticFunctions(m);
        this.addExtensions(m);
        contracts.forEach((c) => this.addContractFunctions(m, c));
        this.addMain(m);

        return m;
    }
}
