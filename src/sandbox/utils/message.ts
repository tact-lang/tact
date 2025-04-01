import type { Address, Message, StateInit } from "@/core";
import { Cell, Dictionary } from "@/core";
import type { ExtraCurrency } from "@/sandbox/utils/ec";
import { packEc } from "@/sandbox/utils/ec";

/**
 * Creates {@link Message} from params.
 */
export function internal(params: {
    from: Address;
    to: Address;
    value: bigint;
    body?: Cell;
    stateInit?: StateInit;
    bounce?: boolean;
    bounced?: boolean;
    ihrDisabled?: boolean;
    ihrFee?: bigint;
    forwardFee?: bigint;
    createdAt?: number;
    createdLt?: bigint;
    ec?: Dictionary<number, bigint> | [number, bigint][] | ExtraCurrency;
}): Message {
    let ecd: Dictionary<number, bigint> | undefined = undefined;
    if (params.ec !== undefined) {
        if (Array.isArray(params.ec)) {
            ecd = packEc(params.ec);
        } else if (params.ec instanceof Dictionary) {
            ecd = params.ec;
        } else {
            ecd = packEc(
                Object.entries(params.ec).map(([k, v]) => [Number(k), v]),
            );
        }
    }
    return {
        info: {
            type: "internal",
            dest: params.to,
            src: params.from,
            value: { coins: params.value, other: ecd },
            bounce: params.bounce ?? true,
            ihrDisabled: params.ihrDisabled ?? true,
            bounced: params.bounced ?? false,
            ihrFee: params.ihrFee ?? 0n,
            forwardFee: params.forwardFee ?? 0n,
            createdAt: params.createdAt ?? 0,
            createdLt: params.createdLt ?? 0n,
        },
        body: params.body ?? new Cell(),
        init: params.stateInit,
    };
}
