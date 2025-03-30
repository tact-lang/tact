/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Maybe } from "../utils/maybe";
import type { ExtraCurrency } from "../types/extra-currency";

export type ContractState = {
    balance: bigint;
    extracurrency: Maybe<ExtraCurrency>;
    last: { lt: bigint; hash: Buffer } | null;
    state:
        | { type: "uninit" }
        | { type: "active"; code: Maybe<Buffer>; data: Maybe<Buffer> }
        | { type: "frozen"; stateHash: Buffer };
};
