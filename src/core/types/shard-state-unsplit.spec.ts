/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { Cell } from "@/core/boc/cell";
import { loadShardStateUnsplit } from "@/core/types/shard-state-unsplit";

describe("ShardStateUnsplit", () => {
    it("should parse ShardState", () => {
        const state =
            "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";
        const cell = Cell.fromBoc(Buffer.from(state, "base64"))[0]!;
        loadShardStateUnsplit(cell.beginParse());
    });
    it("should parse account state with exotic cells", () => {
        const data = require("./__testdata__/configProof");
        const cell = Cell.fromBoc(Buffer.from(data, "base64"))[0]!;
        loadShardStateUnsplit(cell.beginParse());
    });
});
