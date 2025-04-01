/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Cell } from "@/core/boc/cell";
import type { SendMode } from "@/core/types/send-mode";
import type { TupleReader } from "@/core/tuple/reader";
import type { TupleItem } from "@/core/tuple/tuple";
import type { Maybe } from "@/core/utils/maybe";
import type { ContractState } from "@/core/contract/contract-state";
import type { Sender } from "@/core/contract/sender";
import type { Contract } from "@/core/contract/contract";
import type { Address } from "@/core/address/address";
import type { Transaction } from "@/core/types/transaction";
import type { ExtraCurrency } from "@/core/types/extra-currency";
import type { OpenedContract } from "@/core/contract/open-contract";

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
