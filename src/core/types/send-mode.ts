/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

export enum SendMode {
    CARRY_ALL_REMAINING_BALANCE = 128,
    CARRY_ALL_REMAINING_INCOMING_VALUE = 64,
    DESTROY_ACCOUNT_IF_ZERO = 32,
    PAY_GAS_SEPARATELY = 1,
    IGNORE_ERRORS = 2,
    NONE = 0,
}
