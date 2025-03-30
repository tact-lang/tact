/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Builder } from "../boc/builder";
import { beginCell } from "../boc/builder";
import type { Slice } from "../boc/slice";
import type { Maybe } from "../utils/maybe";
import type { ComputeSkipReason } from "./compute-skip-reason";
import {
    loadComputeSkipReason,
    storeComputeSkipReason,
} from "./compute-skip-reason";

// Source: https://github.com/ton-blockchain/ton/blob/24dc184a2ea67f9c47042b4104bbb4d82289fac1/crypto/block/block.tlb#L296
// tr_phase_compute_skipped$0 reason:ComputeSkipReason
//   = TrComputePhase;
// tr_phase_compute_vm$1 success:Bool msg_state_used:Bool
//   account_activated:Bool gas_fees:Grams
//   ^[ gas_used:(VarUInteger 7)
//      gas_limit:(VarUInteger 7) gas_credit:(Maybe (VarUInteger 3))
//      mode:int8 exit_code:int32 exit_arg:(Maybe int32)
//      vm_steps:uint32
//      vm_init_state_hash:bits256 vm_final_state_hash:bits256 ]
//   = TrComputePhase;

export type TransactionComputePhase =
    | TransactionComputeSkipped
    | TransactionComputeVm;
export type TransactionComputeSkipped = {
    type: "skipped";
    reason: ComputeSkipReason;
};
export type TransactionComputeVm = {
    type: "vm";
    success: boolean;
    messageStateUsed: boolean;
    accountActivated: boolean;
    gasFees: bigint;
    gasUsed: bigint;
    gasLimit: bigint;
    gasCredit?: Maybe<bigint>;
    mode: number;
    exitCode: number;
    exitArg?: Maybe<number>;
    vmSteps: number;
    vmInitStateHash: bigint;
    vmFinalStateHash: bigint;
};

export function loadTransactionComputePhase(
    slice: Slice,
): TransactionComputePhase {
    // Skipped
    if (!slice.loadBit()) {
        const reason = loadComputeSkipReason(slice);
        return {
            type: "skipped",
            reason,
        };
    }

    const success = slice.loadBit();
    const messageStateUsed = slice.loadBit();
    const accountActivated = slice.loadBit();
    const gasFees = slice.loadCoins();

    const vmState = slice.loadRef().beginParse();
    const gasUsed = vmState.loadVarUintBig(3);
    const gasLimit = vmState.loadVarUintBig(3);
    const gasCredit = vmState.loadBit() ? vmState.loadVarUintBig(2) : undefined;
    const mode = vmState.loadUint(8);
    const exitCode = vmState.loadInt(32);
    const exitArg = vmState.loadBit() ? vmState.loadInt(32) : undefined;
    const vmSteps = vmState.loadUint(32);
    const vmInitStateHash = vmState.loadUintBig(256);
    const vmFinalStateHash = vmState.loadUintBig(256);
    return {
        type: "vm",
        success,
        messageStateUsed,
        accountActivated,
        gasFees,
        gasUsed,
        gasLimit,
        gasCredit,
        mode,
        exitCode,
        exitArg,
        vmSteps,
        vmInitStateHash,
        vmFinalStateHash,
    };
}

export function storeTransactionComputePhase(src: TransactionComputePhase) {
    return (builder: Builder) => {
        if (src.type === "skipped") {
            builder.storeBit(0);
            builder.store(storeComputeSkipReason(src.reason));
            return;
        }
        builder.storeBit(1);
        builder.storeBit(src.success);
        builder.storeBit(src.messageStateUsed);
        builder.storeBit(src.accountActivated);
        builder.storeCoins(src.gasFees);
        builder.storeRef(
            beginCell()
                .storeVarUint(src.gasUsed, 3)
                .storeVarUint(src.gasLimit, 3)
                .store((b) =>
                    src.gasCredit !== undefined && src.gasCredit !== null
                        ? b.storeBit(1).storeVarUint(src.gasCredit, 2)
                        : b.storeBit(0),
                )
                .storeUint(src.mode, 8)
                .storeInt(src.exitCode, 32)
                .store((b) =>
                    src.exitArg !== undefined && src.exitArg !== null
                        ? b.storeBit(1).storeInt(src.exitArg, 32)
                        : b.storeBit(0),
                )
                .storeUint(src.vmSteps, 32)
                .storeUint(src.vmInitStateHash, 256)
                .storeUint(src.vmFinalStateHash, 256)
                .endCell(),
        );
    };
}
