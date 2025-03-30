/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

export class LevelMask {
    private _mask: number = 0;
    private _hashIndex: number;
    private _hashCount: number;

    constructor(mask: number = 0) {
        this._mask = mask;
        this._hashIndex = countSetBits(this._mask);
        this._hashCount = this._hashIndex + 1;
    }

    get value(): number {
        return this._mask;
    }

    get level(): number {
        return 32 - Math.clz32(this._mask);
    }

    get hashIndex(): number {
        return this._hashIndex;
    }

    get hashCount(): number {
        return this._hashCount;
    }

    apply(level: number): LevelMask {
        return new LevelMask(this._mask & ((1 << level) - 1));
    }

    isSignificant(level: number): boolean {
        const res = level === 0 || (this._mask >> (level - 1)) % 2 !== 0;
        return res;
        // bool res = level == 0 | | ( (mask_ >> (level -1)) % 2 != 0);
    }
}

function countSetBits(n: number): number {
    n = n - ((n >> 1) & 0x55555555);
    n = (n & 0x33333333) + ((n >> 2) & 0x33333333);

    return (((n + (n >> 4)) & 0xf0f0f0f) * 0x1010101) >> 24;
}
