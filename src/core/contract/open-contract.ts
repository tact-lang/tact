/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { Address } from "@/core/address/address";
import { Cell } from "@/core/boc/cell";
import type { StateInit } from "@/core/types/state-init";
import type { Contract } from "@/core/contract/contract";
import type { ContractProvider } from "@/core/contract/contract-provider";

export type OpenedContract<F> = {
    [P in keyof F]: P extends `${"get" | "send" | "is"}${string}`
        ? F[P] extends (x: ContractProvider, ...args: infer P) => infer R
            ? (...args: P) => R
            : never
        : F[P];
};

export function openContract<T extends Contract>(
    src: T,
    factory: (params: {
        address: Address;
        init: StateInit | null;
    }) => ContractProvider,
): OpenedContract<T> {
    // Resolve parameters
    let init: StateInit | null = null;

    if (!Address.isAddress(src.address)) {
        throw Error("Invalid address");
    }
    const address = src.address;
    if (src.init) {
        if (!(src.init.code instanceof Cell)) {
            throw Error("Invalid init.code");
        }
        if (!(src.init.data instanceof Cell)) {
            throw Error("Invalid init.data");
        }
        init = src.init;
    }

    // Create executor
    const executor = factory({ address, init });

    // Create proxy
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Proxy<any>(src as any, {
        get(target, prop) {
            const value = target[prop];
            if (
                typeof prop === "string" &&
                (prop.startsWith("get") ||
                    prop.startsWith("send") ||
                    prop.startsWith("is"))
            ) {
                if (typeof value === "function") {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    return (...args: any[]) =>
                        value.apply(target, [executor, ...args]);
                }
            }
            return value;
        },
    }) as OpenedContract<T>;
}
