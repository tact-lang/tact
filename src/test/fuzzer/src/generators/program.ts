import type * as Ast from "@/ast/ast";
import {
    createSamplesArray,
    createSample,
    randomInt,
    randomBool,
    randomElement,
    generateAstIdFromName,
} from "@/test/fuzzer/src/util";
import { TypeGen, UtilType, getStdlibTypes } from "@/test/fuzzer/src/types";
import { Contract } from "@/test/fuzzer/src/generators/contract";
import { Message, Struct } from "@/test/fuzzer/src/generators/struct";
import { Trait } from "@/test/fuzzer/src/generators/trait";
import { Scope } from "@/test/fuzzer/src/scope";
import { NamedGenerativeEntity } from "@/test/fuzzer/src/generators/generator";
import { getStdlibTraits } from "@/test/fuzzer/src/stdlib";
import fc from "fast-check";
import { GlobalContext } from "@/test/fuzzer/src/context";
import { ConstantDef } from "@/test/fuzzer/src/generators/constant";
import { Expression } from "@/test/fuzzer/src/generators/expression";
import { FunctionDef } from "@/test/fuzzer/src/generators/function";
import { FuzzConfig } from "@/test/fuzzer/src/config";

export interface ProgramParameters {
    /** Add definitions that mock stdlib ones to the generated program. */
    addStdlib: boolean;

    /**
     * Minimum number of structures generated on the program level.
     * @default FuzzConfig.structsMinNum
     */
    structsMinNum: number;

    /**
     * Maximum number of structures generated on the program level.
     * @default FuzzConfig.structsMaxNum
     */
    structsMaxNum: number;

    /**
     * Minimum number of messages generated on the program level.
     * @default FuzzConfig.messagesMinNum
     */
    messagesMinNum: number;

    /**
     * Maximum number of messages generated on the program level.
     * @default FuzzConfig.messagesMaxNum
     */
    messagesMaxNum: number;

    /**
     * Minimum number of the generated traits. Some of them might be used by the generated contracts.
     * @default FuzzConfig.traitsMinNum
     */
    traitsMinNum: number;

    /**
     * Maximum number of the generated traits. Some of them might be used by the generated contracts.
     * @default FuzzConfig.traitsMaxNum
     */
    traitsMaxNum: number;

    /**
     * Minimum number of generated contracts
     * @default FuzzConfig.contractsMinNum
     */
    contractsMinNum: number;

    /**
     * Maximum number of generated contracts
     * @default FuzzConfig.contractsMaxNum
     */
    contractsMaxNum: number;

    /**
     * Minimum number of generated functions
     * @default FuzzConfig.functionsMinNum
     */
    functionsMinNum: number;

    /**
     * Maximum number of generated functions
     * @default FuzzConfig.functionsMaxNum
     */
    functionsMaxNum: number;

    /**
     * Minimum number of function arguments
     * @default FuzzConfig.functionArgsMinNum
     */
    functionArgsMinNum: number;

    /**
     * Maximum number of function arguments
     * @default FuzzConfig.functionArgsMaxNum
     */
    functionArgsMaxNum: number;

    /**
     * Minimum number of generated constants
     * @default FuzzConfig.constantsMinNum
     */
    constantsMinNum: number;

    /**
     * Maximum number of generated constants
     * @default FuzzConfig.constantsMaxNum
     */
    constantsMaxNum: number;
}

/**
 * An object that encapsulates a randomly generated Ast.Module including extra information
 * about its entries and their scopes.
 */
export class Program extends NamedGenerativeEntity<Ast.Module> {
    /** Top-level global scope. */
    private scope: Scope;

    private addStdlib: boolean;

    constructor(params: Partial<ProgramParameters> = {}) {
        super(
            { kind: "util", type: UtilType.Program },
            generateAstIdFromName("program"),
        );

        const {
            addStdlib = FuzzConfig.addStdlib,
            structsMinNum = FuzzConfig.structsMinNum,
            structsMaxNum = FuzzConfig.structsMaxNum,
            messagesMinNum = FuzzConfig.messagesMinNum,
            messagesMaxNum = FuzzConfig.messagesMaxNum,
            traitsMinNum = FuzzConfig.traitsMinNum,
            traitsMaxNum = FuzzConfig.traitsMaxNum,
            contractsMinNum = FuzzConfig.contractsMinNum,
            contractsMaxNum = FuzzConfig.constantsMaxNum,
            functionsMinNum = FuzzConfig.functionsMinNum,
            functionsMaxNum = FuzzConfig.functionsMaxNum,
            functionArgsMinNum = FuzzConfig.functionArgsMinNum,
            functionArgsMaxNum = FuzzConfig.functionArgsMaxNum,
            constantsMinNum = FuzzConfig.constantsMinNum,
            constantsMaxNum = FuzzConfig.constantsMaxNum,
        } = params;
        this.addStdlib = addStdlib;

        this.scope = new Scope("program", undefined);

        // NOTE: Structures and messages must be generated prior to contracts in order
        // to add their entries to scopes for further reuse.
        Array.from({ length: randomInt(structsMinNum, structsMaxNum) }).forEach(
            (_) => {
                this.scope.addNamed("struct", this.makeStruct());
            },
        );

        Array.from({
            length: randomInt(messagesMinNum, messagesMaxNum),
        }).forEach((_) => {
            this.scope.addNamed("message", this.makeMessage());
        });

        // NOTE: Traits must be generated prior to contracts to enable them implement them.
        const traits: Trait[] = [];
        Array.from({ length: randomInt(traitsMinNum, traitsMaxNum) }).forEach(
            (_) => {
                const trait = this.makeTrait();
                traits.push(trait);
                this.scope.addNamed("trait", trait);
            },
        );

        // One of the traits could be implemented by the generated contracts.
        Array.from({
            length: randomInt(contractsMinNum, contractsMaxNum),
        }).forEach((_) => {
            const traitToImplement =
                traits.length > 0 && randomBool()
                    ? randomElement(traits)
                    : undefined;
            this.scope.addNamed(
                "contract",
                this.makeContract(traitToImplement),
            );
        });

        Array.from({
            length: randomInt(functionsMinNum, functionsMaxNum),
        }).forEach((_) => {
            this.scope.addNamed(
                "functionDef",
                this.makeFunction(functionArgsMinNum, functionArgsMaxNum),
            );
        });

        Array.from({
            length: randomInt(constantsMinNum, constantsMaxNum),
        }).forEach((_) => {
            this.scope.addNamed("constantDef", this.makeConstant());
        });
    }

    /**
     * Generates a Tact program.
     *
     * It always follows a structure that includes a single contract with a few methods
     * which are considered as entry points of the random program generation. This means, the generation
     * starts bottom-up from the return types of these methods and adds different AST entries, including
     * constants, functions and contract fields. AST nodes inside the contract implementation may vary,
     * as determined by fast-check.
     */
    public generate(): fc.Arbitrary<Ast.Module> {
        const stdlibEntries = this.addStdlib
            ? getStdlibTraits()
                  .concat(getStdlibTypes())
                  .map((entry) => fc.constant(entry))
            : [];

        const traits = Array.from(this.scope.getAllNamed("trait")).map((t) =>
            t.generate(),
        );
        const contracts = Array.from(this.scope.getAllNamed("contract")).map(
            (c) => c.generate(),
        );
        const structs = Array.from(this.scope.getAllNamed("struct")).map((s) =>
            s.generate(),
        );
        const messages = Array.from(this.scope.getAllNamed("message")).map(
            (m) => m.generate(),
        );
        const constants = Array.from(this.scope.getAllNamed("constantDef")).map(
            (c) => c.generate(),
        );
        const functions = Array.from(this.scope.getAllNamed("functionDef")).map(
            (f) => f.generate(),
        );
        return fc
            .tuple(
                ...stdlibEntries,
                ...structs,
                ...messages,
                ...constants,
                ...functions,
                ...traits,
                ...contracts,
            )
            .map((decls) => GlobalContext.makeF.makeModule([], decls));
    }

    /**
     * Creates a contract object with the predefined structure which is an entry point of the generation.
     * @param trait Trait the generated contract should implement
     */
    private makeContract(trait?: Trait): Contract {
        const methodSignatures = createSamplesArray(
            () => TypeGen.fromScope(this.scope).generateMethod(),
            1,
            3,
        ).map((arb) => createSample(arb));
        return new Contract(this.scope, methodSignatures, trait);
    }

    /**
     * Creates a structure in the program scope.
     */
    private makeStruct(): Struct {
        return new Struct(
            this.scope,
            createSample(TypeGen.fromScope(this.scope).generateStruct(false)),
        );
    }

    /**
     * Creates a message in the program scope.
     */
    private makeMessage(): Message {
        return new Message(
            this.scope,
            createSample(TypeGen.fromScope(this.scope).generateStruct(true)),
        );
    }

    /**
     * Creates a trait in the program scope.
     */
    private makeTrait(): Trait {
        return new Trait(this.scope);
    }

    private makeConstant(): ConstantDef {
        const ty = createSample(TypeGen.fromScope(this.scope).generate());
        return ConstantDef.fromScope(
            this.scope,
            ty,
            new Expression(this.scope, ty, {
                useIdentifiersInExpressions: false,
            }).generate(),
        );
    }

    private makeFunction(minArgsNum: number, maxArgsNum: number): FunctionDef {
        const ty = createSample(
            TypeGen.fromScope(this.scope).generateFun(minArgsNum, maxArgsNum),
        );
        return new FunctionDef(this.scope, "function", ty);
    }
}
