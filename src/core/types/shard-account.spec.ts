/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { inspect } from "util";
import { beginCell } from "../boc/builder";
import { Cell } from "../boc/cell";
import { loadShardAccount, storeShardAccount } from "./shard-account";

describe("ShardAccount", () => {
    it("should parse tonkite cell", () => {
        const boc = Buffer.from(
            "te6cckEBBAEA7wABUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEBAnfACD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqCAkCIGAAAACAAAAAAAAAAGgN4Lazp2QAAE0ACAwCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjPUU3w=",
            "base64",
        );
        const cell = Cell.fromBoc(boc)[0]!;
        const shardAccount = loadShardAccount(cell.beginParse());
        const stored = beginCell()
            .store(storeShardAccount(shardAccount))
            .endCell();
        expect(cell.equals(stored)).toBe(true);
    });
});
