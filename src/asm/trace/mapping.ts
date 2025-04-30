import { DictionaryInfo, Mapping } from "../runtime";
import { Loc as InstrLoc } from "../runtime/util";

/**
 * Represents a location of the single instruction in the code.
 *
 * One instruction can be actually pointing to multiple locations in the code
 * if it is contained in a Cell referenced from multiple places.
 */
export type Loc = {
    readonly file: string;
    readonly line: number;
    readonly otherLines: number[];
};

export const Loc = (file: string, line: number, otherLines: number[]): Loc => ({
    file,
    line,
    otherLines,
});
export const fromParserLoc = (loc: InstrLoc): Loc => ({
    file: loc.file,
    line: loc.line,
    otherLines: [],
});

/**
 * Describes a single instruction in the code.
 */
export type InstructionInfo = {
    /**
     * Name of the instruction.
     */
    readonly name: string;

    /**
     * Location of the instruction in the file.
     */
    readonly loc: undefined | Loc;

    /**
     * Offset of the instruction in the Cell.
     */
    readonly offset: number;

    /**
     * Debug section number.
     *
     * Debug sections are used to group instructions together in the code.
     * This way we later can match several instructions to a single statement in the source code.
     *
     * If instruction is not part of any debug section, this value is -1.
     */
    readonly debugSection: number;
};

export type CellHash = string;

/**
 * Describes mapping of a Cell to its instructions.
 */
export type CellsMapping = Record<
    CellHash,
    | undefined
    | {
          readonly instructions: readonly InstructionInfo[];
      }
>;

/**
 * Describes mapping of a Dictionary cell to its data Cell.
 *
 * @see DictionaryInfo for more information.
 */
export type DictionaryCellInfo = {
    /**
     * Hash of the Dictionary cell.
     */
    readonly cell: CellHash;
    /**
     * Offset of the data cell in the Dictionary cell.
     */
    readonly offset: number;
    /**
     * Hash of the data cell.
     */
    readonly dataCell: CellHash;
};

/**
 * Describes mapping of all cells to their instructions.
 */
export type MappingInfo = {
    /**
     * Mapping of Dictionary cells to their data cells.
     */
    readonly dictionaryCells: readonly DictionaryCellInfo[];
    /**
     * Mapping of all cells to their instructions.
     */
    readonly cells: CellsMapping;
};

const processMapping = (mapping: Mapping, cells: CellsMapping) => {
    const previousData = cells[mapping.cell];

    if (previousData !== undefined) {
        // If we already have this cell in the mapping, we need to merge its
        // instructions with the existing ones.
        // This can happen if we have multiple instructions pointing to the same cell.

        for (const [index, instr] of mapping.instructions.entries()) {
            const line = instr.instr.loc?.line;
            const instructionInfo = previousData.instructions.at(index);
            if (line !== undefined && instructionInfo !== undefined) {
                instructionInfo.loc?.otherLines.push(line);
            }
        }
        return;
    }

    const instructions = mapping.instructions.map(
        ({
            instr: { $: name, loc },
            offset,
            debugSection,
        }): InstructionInfo => ({
            name,
            loc: loc ? fromParserLoc(loc) : undefined,
            offset,
            debugSection,
        }),
    );

    cells[mapping.cell] = { instructions };
};

const buildCellsMapping = (mapping: Mapping, cells: CellsMapping) => {
    const dictionaryInfos: DictionaryInfo[] = [...mapping.dictionaryInfo];
    processMapping(mapping, cells);

    for (const subMapping of mapping.subMappings) {
        processMapping(subMapping, cells);
        for (const it of subMapping.subMappings) {
            dictionaryInfos.push(...buildCellsMapping(it, cells));
        }
    }
    return dictionaryInfos;
};

/**
 * Creates a mapping of all cells to their instructions.
 */
export const createMappingInfo = (m: Mapping): MappingInfo => {
    const cells: CellsMapping = {};

    const dictionaryInfos = buildCellsMapping(m, cells);

    return {
        dictionaryCells: dictionaryInfos.map((it) => ({
            cell: it.builder.asCell().hash().toString("hex"),
            offset: it.offset,
            dataCell: it.childCell.hash().toString("hex"),
        })),
        cells: cells,
    };
};
