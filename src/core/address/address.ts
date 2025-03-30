/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import inspectSymbol from "symbol.inspect";
import { crc16 } from "../utils/crc16";

const bounceable_tag = 0x11;
const non_bounceable_tag = 0x51;
const test_flag = 0x80;

function parseFriendlyAddress(src: string | Buffer) {
    if (typeof src === "string" && !Address.isFriendly(src)) {
        throw new Error("Unknown address type");
    }

    const data = Buffer.isBuffer(src) ? src : Buffer.from(src, "base64");

    // 1byte tag + 1byte workchain + 32 bytes hash + 2 byte crc
    if (data.length !== 36) {
        throw new Error("Unknown address type: byte length is not equal to 36");
    }

    // Prepare data
    const addr = data.subarray(0, 34);
    const crc = data.subarray(34, 36);
    const calcedCrc = crc16(addr);
    if (!(calcedCrc[0] === crc[0] && calcedCrc[1] === crc[1])) {
        throw new Error("Invalid checksum: " + src);
    }

    // Parse tag
    let tag = addr[0]!;
    if (typeof tag === "undefined") {
        throw new Error("Impossible");
    }
    let isTestOnly = false;
    let isBounceable = false;
    if (tag & test_flag) {
        isTestOnly = true;
        tag = tag ^ test_flag;
    }
    if (tag !== bounceable_tag && tag !== non_bounceable_tag)
        throw "Unknown address tag";

    isBounceable = tag === bounceable_tag;

    let workchain = null;
    if (addr[1] === 0xff) {
        // TODO we should read signed integer here
        workchain = -1;
    } else {
        workchain = addr[1]!;
    }

    const hashPart = addr.subarray(2, 34);

    return { isTestOnly, isBounceable, workchain, hashPart };
}

export class Address {
    static isAddress(src: any): src is Address {
        return src instanceof Address;
    }

    static isFriendly(source: string) {
        // Check length
        if (source.length !== 48) {
            return false;
        }
        // Check if address is valid base64
        if (!/[A-Za-z0-9+/_-]+/.test(source)) {
            return false;
        }

        return true;
    }

    static isRaw(source: string) {
        // Check if has delimiter
        if (!source.includes(":")) {
            return false;
        }

        const [wc, hash] = source.split(":");

        if (typeof wc === 'undefined' || typeof hash === 'undefined') {
            return false;
        }

        // wc is not valid
        if (!Number.isInteger(parseFloat(wc))) {
            return false;
        }

        // hash is not valid
        if (!/[a-f0-9]+/.test(hash.toLowerCase())) {
            return false;
        }

        // has is not correct
        if (hash.length !== 64) {
            return false;
        }

        return true;
    }

    static normalize(source: string | Address) {
        if (typeof source === "string") {
            return Address.parse(source).toString();
        } else {
            return source.toString();
        }
    }

    static parse(source: string) {
        if (Address.isFriendly(source)) {
            return this.parseFriendly(source).address;
        } else if (Address.isRaw(source)) {
            return this.parseRaw(source);
        } else {
            throw new Error("Unknown address type: " + source);
        }
    }

    static parseRaw(source: string) {
        const parts = source.split(":");
        const [wc, h] = parts;
        if (typeof wc === 'undefined' || typeof h === 'undefined' || parts.length !== 2) {
            throw new Error('Invalid address');
        }

        const workChain = parseInt(wc);
        const hash = Buffer.from(h, "hex");

        return new Address(workChain, hash);
    }

    static parseFriendly(source: string | Buffer) {
        if (Buffer.isBuffer(source)) {
            const r = parseFriendlyAddress(source);
            return {
                isBounceable: r.isBounceable,
                isTestOnly: r.isTestOnly,
                address: new Address(r.workchain, r.hashPart),
            };
        } else {
            const addr = source.replace(/\-/g, "+").replace(/_/g, "\/"); // Convert from url-friendly to true base64
            const r = parseFriendlyAddress(addr);
            return {
                isBounceable: r.isBounceable,
                isTestOnly: r.isTestOnly,
                address: new Address(r.workchain, r.hashPart),
            };
        }
    }

    readonly workChain: number;
    readonly hash: Buffer;

    constructor(workChain: number, hash: Buffer) {
        if (hash.length !== 32) {
            throw new Error("Invalid address hash length: " + hash.length);
        }

        this.workChain = workChain;
        this.hash = hash;
        Object.freeze(this);
    }

    toRawString = () => {
        return this.workChain + ":" + this.hash.toString("hex");
    };

    equals(src: Address) {
        if (src.workChain !== this.workChain) {
            return false;
        }
        return src.hash.equals(this.hash);
    }

    toRaw = () => {
        const addressWithChecksum = Buffer.alloc(36);
        addressWithChecksum.set(this.hash);
        addressWithChecksum.set(
            [this.workChain, this.workChain, this.workChain, this.workChain],
            32,
        );
        return addressWithChecksum;
    };

    toStringBuffer = (args?: { bounceable?: boolean; testOnly?: boolean }) => {
        const testOnly = args?.testOnly !== undefined ? args.testOnly : false;
        const bounceable =
            args?.bounceable !== undefined ? args.bounceable : true;

        let tag = bounceable ? bounceable_tag : non_bounceable_tag;
        if (testOnly) {
            tag |= test_flag;
        }

        const addr = Buffer.alloc(34);
        addr[0] = tag;
        addr[1] = this.workChain;
        addr.set(this.hash, 2);
        const addressWithChecksum = Buffer.alloc(36);
        addressWithChecksum.set(addr);
        addressWithChecksum.set(crc16(addr), 34);
        return addressWithChecksum;
    };

    toString = (args?: {
        urlSafe?: boolean;
        bounceable?: boolean;
        testOnly?: boolean;
    }) => {
        const urlSafe = args?.urlSafe !== undefined ? args.urlSafe : true;
        const buffer = this.toStringBuffer(args);
        if (urlSafe) {
            return buffer
                .toString("base64")
                .replace(/\+/g, "-")
                .replace(/\//g, "_");
        } else {
            return buffer.toString("base64");
        }
    };

    [inspectSymbol] = () => this.toString();
}

export function address(src: string) {
    return Address.parse(src);
}
