/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

export enum ReserveMode {
    THIS_AMOUNT = 0,
    LEAVE_THIS_AMOUNT = 1,
    AT_MOST_THIS_AMOUNT = 2,
    LEAVE_MAX_THIS_AMOUNT = 3,
    BEFORE_BALANCE_PLUS_THIS_AMOUNT = 4,
    LEAVE_BBALANCE_PLUS_THIS_AMOUNT = 5,
    BEFORE_BALANCE_MINUS_THIS_AMOUNT = 12,
    LEAVE_BEFORE_BALANCE_MINUS_THIS_AMOUNT = 13,
}
