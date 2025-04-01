/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "@/core/boc/builder";
import type { StateInit } from "@/core/types/state-init";
import { storeStateInit } from "@/core/types/state-init";
import { Address } from "@/core/address/address";

export function contractAddress(workchain: number, init: StateInit) {
    const hash = beginCell().store(storeStateInit(init)).endCell().hash();
    return new Address(workchain, hash);
}
