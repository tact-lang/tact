import type { AstModule } from "../../../src/ast/ast";
import {
    createSamplesArray,
    createSample,
    randomInt,
    randomBool,
    randomElement,
    generateAstIdFromName,
} from "../util";
import { TypeGen, UtilType, getStdlibTypes } from "../types";
import { Contract } from "./contract";
import { Message, Struct } from "./struct";
import { Trait } from "./trait";
import { Scope } from "../scope";
import { NamedGenerativeEntity } from "./generator";
import { getStdlibTraits } from "../stdlib";

import fc from "fast-check";

export interface ProgramParameters {
    /** Add definitions that mock stdlib ones to the generated program. */
    addStdlib: boolean;

    /**
     * Number of structures generated on the program level.
     * @default Random: [1-3]
     */
    structsNum: number;

    /**
     * Number of messages generated on the program level.
     * @default Random: [1-3]
     */
    messagesNum: number;

    /**
     * Number of the generated traits. Some of them might be used by the generated contracts.
     * @default Random: [1-2]
     */
    traitsNum: number;
}

/**
 * An object that encapsulates a randomly generated AstModule including extra information
 * about its entries and their scopes.
 */
export class Program extends NamedGenerativeEntity<AstModule> {
    /** Top-level global scope. */
    private scope: Scope;

    private addStdlib: boolean;

    constructor(params: Partial<ProgramParameters> = {}) {
        super(
            { kind: "util", type: UtilType.Program },
            generateAstIdFromName("program"),
        );

        const {
            addStdlib = false,
            structsNum = randomInt(1, 3),
            messagesNum = randomInt(1, 3),
            traitsNum = randomInt(1, 2),
        } = params;
        this.addStdlib = addStdlib;

        this.scope = new Scope("program", undefined);

        // NOTE: Structures and messages must be generated prior to contracts in order
        // to add their entries to scopes for futher reuse.
        Array.from({ length: structsNum }).forEach((_) => {
            this.scope.addNamed("struct", this.makeStruct());
        });

        Array.from({ length: messagesNum }).forEach((_) => {
            this.scope.addNamed("message", this.makeMessage());
        });

        // NOTE: Traits must be generated prior to contracts to enable them implement them.
        const traits: Trait[] = [];
        Array.from({ length: traitsNum }).forEach((_) => {
            const trait = this.makeTrait();
            traits.push(trait);
            this.scope.addNamed("trait", trait);
        });

        // One of the traits could be implemented by the main contract.
        const traitToImplement =
            traitsNum > 0 && randomBool() ? randomElement(traits) : undefined;
        this.scope.addNamed("contract", this.makeContract(traitToImplement));
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
    public generate(): fc.Arbitrary<AstModule> {
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
        return fc.record<AstModule>({
            kind: fc.constantFrom("module"),
            id: fc.constantFrom(this.idx),
            items: fc.tuple(
                ...stdlibEntries,
                ...structs,
                ...messages,
                ...constants,
                ...functions,
                ...traits,
                ...contracts,
            ),
            imports: fc.constant([]),
        });
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
        // TODO: What if the struct-instance/field pair is the same as second-contract-instance/field pair?
        return new Struct(
            this.scope,
            createSample(TypeGen.fromScope(this.scope).generateStruct(false)),
        );
    }

    /**
     * Creates a message in the program scope.
     */
    private makeMessage(): Message {
        // TODO: What if the struct-instance/field pair is the same as second-contract-instance/field pair?
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
}
