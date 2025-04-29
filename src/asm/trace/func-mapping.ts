/**
 * Represents a FunC source location.
 */
export type FuncSourceLoc = {
    readonly file: string
    readonly line: number
    readonly pos: number
    readonly vars: undefined | string[]
    readonly func: string
    readonly first_stmt: undefined | boolean
    readonly ret: undefined | boolean
}

/**
 * Represents a FunC global variable descriptor.
 */
export type FuncGlobalVar = {
    readonly name: string
}

/**
 * Represents a FunC mapping.
 */
export type FuncMapping = {
    readonly globals: readonly FuncGlobalVar[]
    readonly locations: readonly FuncSourceLoc[]
}

/**
 * Loads a FunC mapping from a string.
 */
export const loadFuncMapping = (content: string): FuncMapping => {
    return JSON.parse(content) as FuncMapping
}
