/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Cell } from "../boc/cell";
import type { SendMode } from "../types/send-mode";
import type { TupleReader } from "../tuple/reader";
import type { TupleItem } from "../tuple/tuple";
import type { Maybe } from "../utils/maybe";
import type { ContractState } from "./contract-state";
import type { Sender } from "./sender";
import type { Contract } from "./contract";
import type { Address } from "../address/address";
import type { Transaction } from "../types/transaction";
import type { ExtraCurrency } from "../types/extra-currency";
import type { OpenedContract } from "./open-contract";

export type ContractGetMethodResult = {
    stack: TupleReader;
    gasUsed?: Maybe<bigint>;
    logs?: Maybe<string>;
};

export interface ContractProvider {
    getState(): Promise<ContractState>;
    get(
        name: string | number,
        args: TupleItem[],
    ): Promise<ContractGetMethodResult>;
    external(message: Cell): Promise<void>;
    internal(
        via: Sender,
        args: {
            value: bigint | string;
            extracurrency?: ExtraCurrency;
            bounce?: Maybe<boolean>;
            sendMode?: SendMode;
            body?: Maybe<Cell | string>;
        },
    ): Promise<void>;
    open<T extends Contract>(contract: T): OpenedContract<T>;
    getTransactions(
        address: Address,
        lt: bigint,
        hash: Buffer,
        limit?: number,
    ): Promise<Transaction[]>;
}
