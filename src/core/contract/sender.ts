/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Address } from "@/core/address/address";
import type { Cell } from "@/core/boc/cell";
import type { SendMode } from "@/core/types/send-mode";
import type { StateInit } from "@/core/types/state-init";
import type { ExtraCurrency } from "@/core/types/extra-currency";
import type { Maybe } from "@/core/utils/maybe";

export type SenderArguments = {
    value: bigint;
    to: Address;
    extracurrency?: Maybe<ExtraCurrency>;
    sendMode?: Maybe<SendMode>;
    bounce?: Maybe<boolean>;
    init?: Maybe<StateInit>;
    body?: Maybe<Cell>;
};

export interface Sender {
    readonly address?: Address;
    send(args: SenderArguments): Promise<void>;
}
