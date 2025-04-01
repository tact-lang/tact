/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "@/core/address/address";
import { Cell } from "@/core/boc/cell";
import type { StateInit } from "@/core/types/state-init";
import type { Maybe } from "@/core/utils/maybe";
import type { ContractABI } from "@/core/contract/contract-abi";

export interface Contract {
    readonly address: Address;
    readonly init?: Maybe<StateInit>;
    readonly abi?: Maybe<ContractABI>;
}
