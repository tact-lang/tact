/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Cell } from "@/core/boc/cell";

const ITERATION_LIMIT = 100000;

export function topologicalSort(src: Cell): { cell: Cell; refs: number[] }[] {
    let pending: Cell[] = [src];
    const allCells: Map<string, { cell: Cell; refs: string[] }> = new Map();
    const notPermCells: Set<string> = new Set();
    const sorted: string[] = [];
    while (pending.length > 0) {
        const cells = [...pending];
        pending = [];
        for (const cell of cells) {
            const hash = cell.hash().toString("hex");
            if (allCells.has(hash)) {
                continue;
            }
            notPermCells.add(hash);
            allCells.set(hash, {
                cell: cell,
                refs: cell.refs.map((v) => v.hash().toString("hex")),
            });
            for (const r of cell.refs) {
                pending.push(r);
            }
        }
    }
    const tempMark: Set<string> = new Set();
    function visit(hash: string) {
        if (!notPermCells.has(hash)) {
            return;
        }
        if (tempMark.has(hash)) {
            throw Error("Not a DAG");
        }
        tempMark.add(hash);
        const refs = allCells.get(hash)!.refs;
        [...refs].reverse().forEach(ref => visit(ref));
        sorted.push(hash);
        tempMark.delete(hash);
        notPermCells.delete(hash);
    }
    for (let i = 0; i < ITERATION_LIMIT; ++i) {
        const id = Array.from(notPermCells)[0];
        if (typeof id === 'undefined') {
            break;
        }
        visit(id);
    }

    sorted.reverse()

    const indexes: Map<string, number> = new Map();
    sorted.forEach((s, i) => {
        indexes.set(s, i);
    });

    return sorted.map(ent => {
        const rrr = allCells.get(ent)!;
        return {
            cell: rrr.cell,
            refs: rrr.refs.map((v) => indexes.get(v)!),
        };
    })
}
