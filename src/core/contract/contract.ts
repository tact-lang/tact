/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "../address/address";
import { Cell } from "../boc/cell";
import type { StateInit } from "../types/state-init";
import type { Maybe } from "../utils/maybe";
import type { ContractABI } from "./contract-abi";

export interface Contract {
    readonly address: Address;
    readonly init?: Maybe<StateInit>;
    readonly abi?: Maybe<ContractABI>;
}
