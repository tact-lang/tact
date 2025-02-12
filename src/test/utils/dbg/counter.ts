export type Line = {
    source: string;
    lineNum: number;
}
export type Counter = { ref: number, lines: Line[] }
export const dummyCounter: Counter = { ref: 0, lines: [] }