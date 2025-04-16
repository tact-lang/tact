import { throwCompilationError } from "@/error/errors";
import type { SrcInfo } from "@/grammar";

export function topologicalSort<T extends object>(
    src: T[],
    references: (src: T) => T[],
    info: (src: T) => [string, SrcInfo] | undefined,
) {
    const result: T[] = [];
    const visited: Set<T> = new Set();
    const visiting: Set<T> = new Set();
    const path: T[] = [];

    const visit = (src: T) => {
        if (visiting.has(src)) {
            onCycleFound(path, src, info);
        }

        if (!visited.has(src)) {
            visiting.add(src);
            path.push(src);

            for (const r of references(src)) {
                visit(r);
            }

            path.pop();
            visiting.delete(src);
            visited.add(src);
            result.push(src);
        }
    };

    for (const s of src) {
        visit(s);
    }

    return result;
}

function onCycleFound<T>(
    path: T[],
    src: T,
    info: (src: T) => [string, SrcInfo] | undefined,
) {
    const cycleStart = path.indexOf(src);
    const cycle = [...path.slice(cycleStart), src];

    const infos = cycle
        .map((it) => info(it))
        .filter((it) => typeof it !== "undefined");
    if (infos.length === 0) {
        throwCompilationError(`Cycle detected`);
    }

    const cycleRepresentation = infos.map(([name]) => name).join(" -> ");
    throwCompilationError(
        `Cycle detected: ${cycleRepresentation}`,
        infos[0]?.[1],
    );
}
