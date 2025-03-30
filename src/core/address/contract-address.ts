/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "../boc/builder";
import type { StateInit } from "../types/state-init";
import { storeStateInit } from "../types/state-init";
import { Address } from "./address";

export function contractAddress(workchain: number, init: StateInit) {
    const hash = beginCell().store(storeStateInit(init)).endCell().hash();
    return new Address(workchain, hash);
}
