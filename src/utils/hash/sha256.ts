const K = [
	0x428A2F98,
	0x71374491,
	0xB5C0FBCF,
	0xE9B5DBA5,
	0x3956C25B,
	0x59F111F1,
	0x923F82A4,
	0xAB1C5ED5,
	0xD807AA98,
	0x12835B01,
	0x243185BE,
	0x550C7DC3,
	0x72BE5D74,
	0x80DEB1FE,
	0x9BDC06A7,
	0xC19BF174,
	0xE49B69C1,
	0xEFBE4786,
	0x0FC19DC6,
	0x240CA1CC,
	0x2DE92C6F,
	0x4A7484AA,
	0x5CB0A9DC,
	0x76F988DA,
	0x983E5152,
	0xA831C66D,
	0xB00327C8,
	0xBF597FC7,
	0xC6E00BF3,
	0xD5A79147,
	0x06CA6351,
	0x14292967,
	0x27B70A85,
	0x2E1B2138,
	0x4D2C6DFC,
	0x53380D13,
	0x650A7354,
	0x766A0ABB,
	0x81C2C92E,
	0x92722C85,
	0xA2BFE8A1,
	0xA81A664B,
	0xC24B8B70,
	0xC76C51A3,
	0xD192E819,
	0xD6990624,
	0xF40E3585,
	0x106AA070,
	0x19A4C116,
	0x1E376C08,
	0x2748774C,
	0x34B0BCB5,
	0x391C0CB3,
	0x4ED8AA4A,
	0x5B9CCA4F,
	0x682E6FF3,
	0x748F82EE,
	0x78A5636F,
	0x84C87814,
	0x8CC70208,
	0x90BEFFFA,
	0xA4506CEB,
	0xBEF9A3F7,
	0xC67178F2
];

const W = new Array(64);

export function Sha256() {
	const _w = W; // new Array(64)
    let _a = 0x6a09e667;
	let _b = 0xbb67ae85;
	let _c = 0x3c6ef372;
	let _d = 0xa54ff53a;
	let _e = 0x510e527f;
	let _f = 0x9b05688c;
	let _g = 0x1f83d9ab;
	let _h = 0x5be0cd19;

	const _block = Buffer.alloc(64);
	const _finalSize = 56;
	const _blockSize = 64;
	let _len = 0;

    const _update = function (M: Buffer) {
        const w = _w;
        let a = _a | 0;
        let b = _b | 0;
        let c = _c | 0;
        let d = _d | 0;
        let e = _e | 0;
        let f = _f | 0;
        let g = _g | 0;
        let h = _h | 0;
    
        let i: number = 0;
        for (; i < 16; ++i) {
            w[i] = M.readInt32BE(i * 4);
        }
        for (; i < 64; ++i) {
            w[i] = (gamma1(w[i - 2]) + w[i - 7] + gamma0(w[i - 15]) + w[i - 16]) | 0;
        }
    
        for (let j = 0; j < 64; ++j) {
            const T1 = (h + sigma1(e) + ch(e, f, g) + K[j]! + w[j]) | 0;
            const T2 = (sigma0(a) + maj(a, b, c)) | 0;
    
            h = g;
            g = f;
            f = e;
            e = (d + T1) | 0;
            d = c;
            c = b;
            b = a;
            a = (T1 + T2) | 0;
        }
    
        _a = (a + _a) | 0;
        _b = (b + _b) | 0;
        _c = (c + _c) | 0;
        _d = (d + _d) | 0;
        _e = (e + _e) | 0;
        _f = (f + _f) | 0;
        _g = (g + _g) | 0;
        _h = (h + _h) | 0;
    };
    
    const _hash = function () {
        const H = Buffer.allocUnsafe(32);
    
        H.writeInt32BE(_a, 0);
        H.writeInt32BE(_b, 4);
        H.writeInt32BE(_c, 8);
        H.writeInt32BE(_d, 12);
        H.writeInt32BE(_e, 16);
        H.writeInt32BE(_f, 20);
        H.writeInt32BE(_g, 24);
        H.writeInt32BE(_h, 28);
    
        return H;
    };

    const update = function (data: string | Buffer, enc?: BufferEncoding) {
        /* eslint no-param-reassign: 0 */
        if (typeof data === 'string') {
            enc = enc ?? 'utf8';
            data = Buffer.from(data, enc);
        }
    
        const block = _block;
        const blockSize = _blockSize;
        const length = data.length;
        let accum = _len;
    
        for (let offset = 0; offset < length;) {
            const assigned = accum % blockSize;
            const remainder = Math.min(length - offset, blockSize - assigned);
    
            for (let i = 0; i < remainder; i++) {
                block[assigned + i] = data[offset + i]!;
            }
    
            accum += remainder;
            offset += remainder;
    
            if ((accum % blockSize) === 0) {
                _update(block);
            }
        }
    
        _len += length;
        return self;
    };

    const digest = function (enc: 'hex') {
        const rem = _len % _blockSize;
    
        _block[rem] = 0x80;
    
        /*
         * zero (rem + 1) trailing bits, where (rem + 1) is the smallest
         * non-negative solution to the equation (length + 1 + (rem + 1)) === finalSize mod blockSize
         */
        _block.fill(0, rem + 1);
    
        if (rem >= _finalSize) {
            _update(_block);
            _block.fill(0);
        }
    
        const bits = _len * 8;
    
        // uint32
        if (bits <= 0xffffffff) {
            _block.writeUInt32BE(bits, _blockSize - 4);
    
            // uint64
        } else {
            const lowBits = (bits & 0xffffffff) >>> 0;
            const highBits = (bits - lowBits) / 0x100000000;
    
            _block.writeUInt32BE(highBits, _blockSize - 8);
            _block.writeUInt32BE(lowBits, _blockSize - 4);
        }
    
        _update(_block);
        const hash = _hash();
    
        return hash.toString(enc);
    }

    const self = { update, digest };

    return self;
}

function ch(x: number, y: number, z: number) {
	return z ^ (x & (y ^ z));
}

function maj(x: number, y: number, z: number) {
	return (x & y) | (z & (x | y));
}

function sigma0(x: number) {
	return ((x >>> 2) | (x << 30)) ^ ((x >>> 13) | (x << 19)) ^ ((x >>> 22) | (x << 10));
}

function sigma1(x: number) {
	return ((x >>> 6) | (x << 26)) ^ ((x >>> 11) | (x << 21)) ^ ((x >>> 25) | (x << 7));
}

function gamma0(x: number) {
	return ((x >>> 7) | (x << 25)) ^ ((x >>> 18) | (x << 14)) ^ (x >>> 3);
}

function gamma1(x: number) {
	return ((x >>> 17) | (x << 15)) ^ ((x >>> 19) | (x << 13)) ^ (x >>> 10);
}
