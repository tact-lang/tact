import {Cell} from "@ton/core"
import {Mapping} from "../runtime/builder"
import {compileCellWithMapping, decompileCell} from "../runtime"
import {print} from "../text/printer"
import {parse} from "../text/parse"
import {createMappingInfo} from "../trace/mapping"
import {createTraceInfoPerTransaction} from "../trace/trace"
import {buildFuncLineInfo, buildLineInfo, generateCoverageSummary} from "./data"
import {loadFuncMapping} from "../trace/func-mapping"
import {readFileSync} from "node:fs"

export function collectAsmCoverage(cell: Cell, logs: string) {
    const [cleanCell, mapping] = recompileCell(cell, false)
    const info = createMappingInfo(mapping)

    const traceInfos = createTraceInfoPerTransaction(logs, info, undefined)
    const assembly = print(decompileCell(cleanCell))
    const combinedTrace = {steps: traceInfos.flatMap(trace => trace.steps)}
    const combinedLines = buildLineInfo(combinedTrace, assembly)
    const combinedSummary = generateCoverageSummary(combinedLines)
    return {lines: combinedLines, summary: combinedSummary}
}

export function collectFuncCoverage(
    cell: Cell,
    logs: string,
    funcSources: string,
    funcMappingPath: string,
) {
    const [_, mapping] = recompileCell(cell, true)
    const info = createMappingInfo(mapping)

    const funcMapping = loadFuncMapping(readFileSync(funcMappingPath, "utf8"))
    const traceInfos = createTraceInfoPerTransaction(logs, info, funcMapping)
    const func = readFileSync(funcSources, "utf8")
    const combinedLines = buildFuncLineInfo(traceInfos, func)
    const combinedSummary = generateCoverageSummary(combinedLines)
    return {lines: combinedLines, summary: combinedSummary}
}

export const recompileCell = (cell: Cell, forFunC: boolean): [Cell, Mapping] => {
    const instructionsWithoutPositions = decompileCell(cell)
    const assemblyForPositionsRaw = print(instructionsWithoutPositions)

    // filter out all DEBUGMARK lines from the assembly
    const assemblyForPositions = forFunC
        ? assemblyForPositionsRaw
        : assemblyForPositionsRaw
              .split("\n")
              .filter(it => !it.includes("DEBUGMARK"))
              .join("\n")

    const parseResult = parse("out.tasm", assemblyForPositions)
    if (parseResult.$ === "ParseFailure") {
        throw new Error("Cannot parse resulting text Assembly")
    }

    return compileCellWithMapping(parseResult.instructions)
}
