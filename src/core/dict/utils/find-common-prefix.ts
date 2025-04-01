/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

export function findCommonPrefix(src: string[], startPos = 0) {
    // Corner cases
    const [firstSrc, ...restSrc] = src;
    if (src.length === 0 || typeof firstSrc === "undefined") {
        return "";
    }

    let r = firstSrc.slice(startPos);

    for (const s of restSrc) {
        while (s.indexOf(r, startPos) !== startPos) {
            r = r.substring(0, r.length - 1);

            if (r === "") {
                return r;
            }
        }
    }

    return r;
}
