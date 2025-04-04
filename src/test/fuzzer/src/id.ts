export type IDIdx = number;

let currentId: IDIdx = 0;

export function nextId(): IDIdx {
    currentId += 1;
    return currentId;
}
