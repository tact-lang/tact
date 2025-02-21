import type { TypeDescription } from "../types/types";

export const topSortContracts = (
    allContracts: TypeDescription[],
): TypeDescription[] | undefined => {
    const visitingNow: Set<TypeDescription> = new Set();
    const visited: Set<TypeDescription> = new Set();
    const result: TypeDescription[] = [];
    const dfs = (contract: TypeDescription): boolean => {
        visitingNow.add(contract);
        for (const c of contract.dependsOn) {
            if (c.kind !== "contract") {
                continue;
            }
            if (visitingNow.has(c)) {
                return false;
            }
            if (!visited.has(c)) {
                if (!dfs(c)) {
                    return false;
                }
            }
        }
        visitingNow.delete(contract);
        visited.add(contract);
        result.push(contract);
        return true;
    };
    for (const contract of allContracts) {
        if (!visited.has(contract)) {
            if (!dfs(contract)) {
                return undefined;
            }
        }
    }
    return result;
};
