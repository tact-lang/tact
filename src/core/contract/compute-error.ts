/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import type { Maybe } from "@/core/utils/maybe";

export class ComputeError extends Error {
    exitCode: number;
    debugLogs: string | null;
    logs: string | null;

    constructor(
        message: string,
        exitCode: number,
        opts?: { debugLogs?: Maybe<string>; logs?: Maybe<string> },
    ) {
        super(message);
        this.exitCode = exitCode;
        this.debugLogs = opts?.debugLogs ?? null;
        this.logs = opts?.logs ?? null;
        Object.setPrototypeOf(this, ComputeError.prototype);
    }
}
