import { Builder, Cell } from "@ton/core";
import { Instr } from "@/asm/runtime/instr-gen";
import { Dictionary, DictionaryKeyTypes } from "@/asm/dict/Dictionary";

/**
 * Describes an instruction with its offset in the parent `Cell`.
 */
export type InstructionWithOffset = {
    instr: Instr;
    offset: number;
    debugSection: number;
};

/**
 * Describes a mapping of a single `Cell` to its instructions and sub-mappings.
 *
 * This mapping is crucial for debugging, since in Sandbox logs we only have
 * a hash of the current Cell and instruction offset in it.
 */
export type Mapping = {
    /**
     * The hash of the `Cell` that is being mapped.
     */
    cell: string;
    /**
     * The instructions that are stored in the `Cell`.
     */
    instructions: InstructionWithOffset[];
    /**
     * Instructions can store references to other cells.
     * These references are stored in this array.
     */
    subMappings: Mapping[];
    /**
     * When we serialize a `Dictionary`, we store additional information
     * about the position of the cell in the dictionary Cell.
     */
    dictionaryInfo: DictionaryInfo[];
};

/**
 * When we serialize a `Dictionary`, we store actual Cell data after some prefix.
 * If we want to map Dictionary Cell to its instructions, we need to store
 * information about which Dictionary Cell contains Cell with instructions
 * and its offset in the Dictionary Cell.
 *
 * When we parse Sandbox logs, we have a hash of the Dictionary Cell, but we actually
 * want to get the instructions, so we need this information to map the Dictionary Cell
 * to its instructions.
 */
export type DictionaryInfo = {
    /**
     * The `CodeBuilder` that builds the Dictionary Cell.
     */
    builder: CodeBuilder;
    /**
     * The offset of the Cell with instructions in the Dictionary Cell.
     */
    offset: number;
    /**
     * The `Cell` that contains the instructions.
     */
    childCell: Cell;
};

/**
 * Extended Builder class that stores additional debug information.
 */
export class CodeBuilder extends Builder {
    private readonly instructions: InstructionWithOffset[] = [];
    private readonly subMappings: Mapping[] = [];
    private readonly dictionaryInfo: DictionaryInfo[] = [];
    private debugSectionId: number = -1;

    public storeInstructionPrefix(
        value: bigint | number,
        bits: number,
        instr: Instr,
    ): this {
        this.instructions.push({
            instr,
            offset: this.bits,
            debugSection: this.debugSectionId,
        });
        return super.storeUint(value, bits);
    }

    public build(): [Cell, Mapping] {
        const cell = this.asCell();
        return [
            cell,
            {
                cell: cell.hash().toString("hex"),
                instructions: this.instructions,
                subMappings: this.subMappings,
                dictionaryInfo: this.dictionaryInfo,
            },
        ];
    }

    public startDebugSection(id: number): this {
        this.debugSectionId = id;
        return this;
    }

    public pushMappings(...mappings: Mapping[]): this {
        this.subMappings.push(...mappings);
        return this;
    }

    public pushInstructions(...instructions: InstructionWithOffset[]): this {
        this.instructions.push(...instructions);
        return this;
    }

    public getDictionaryInfo(): DictionaryInfo[] {
        return this.dictionaryInfo;
    }

    public pushDictionaryInfo(...info: DictionaryInfo[]): this {
        this.dictionaryInfo.push(...info);
        return this;
    }

    public storeRefWithMapping([cell, mapping]: [Cell, Mapping]): this {
        this.subMappings.push(mapping);
        return super.storeRef(cell);
    }

    // @ts-expect-error TS2416
    public override storeDictDirect<K extends DictionaryKeyTypes, V>(
        dict: Dictionary<K, V>,
    ) {
        dict.storeDirect(this);
        return this;
    }
}
