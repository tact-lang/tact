import { OpenedContract, beginCell, toNano } from '@ton/core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { DNSTester } from './features/output/dns_DNSTester';

function convertToInternal(src: string) {
    if (src === '.') {
        return Buffer.alloc(1, 0);
    }
    const parts = src.split('.').map((x) => Buffer.from(x));
    let res = Buffer.alloc(0);
    for (let i = 0; i < parts.length; i++) {
        if (i > 0) {
            res = Buffer.concat([res, Buffer.from([0])]);
        }
        res = Buffer.concat([res, parts[parts.length - i - 1]]);
    }
    res = Buffer.concat([res, Buffer.from([0])]);
    return res;
    // let res = Buffer.alloc(0);
    // for (let s of src) {
    //     if (s === '.') {
    //         res = Buffer.concat([res, Buffer.from([0])]);
    //     } else {
    //         res = Buffer.concat([res, Buffer.from(s, 'latin1')]);
    //     }
    // }
    // if (!src.endsWith('.')) {
    //     res = Buffer.concat([res, Buffer.from([0])]);
    // }
    // return res;
}

describe('feature-dns', () => {

    let contract: OpenedContract<DNSTester>;

    beforeEach(async () => {
        __DANGER_resetNodeId();
        const system = await ContractSystem.create();
        const treasure = system.treasure('treasure');
        contract = system.open(await DNSTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();
    });

    const invalidNames = [
        '..',
        'a..b',
        'a.b..c',
        'a.b.c..',
        'a.!b',
        'a.-b',
        'a.b-',
        '_a.b',
        'a..b',
        'a b',
        'A.b'
    ];
    const validNames = [
        '.',
        'ton.dns',
        'a.b',
        'a.b.c',
        'a.b.c.d',
        'a.b.c.',
        'ton-dns.com',
        'ton-dns.com.hello',
    ];

    const equalNormalized = [
        ['ton.dns', 't0n.dns'],
        ['t1n.dns', 'tln.dns'],
    ];
    const notEqualNormalized = [
        ['ton.dns', 'tan.dns'],
        ['t1n.dns', 'tin.dns'],
    ];

    for (let i = 0; i < invalidNames.length; i++) {
        it(`should fail on invalid name: ${invalidNames[i]}`, async () => {
            expect(await contract.getStringToInternal(invalidNames[i])).toBe(null);
            const internalAddress = convertToInternal(invalidNames[i]);
            expect(await contract.getDnsInternalVerify(beginCell().storeBuffer(internalAddress).endCell())).toBe(false);
        });
    }

    for (let i = 0; i < validNames.length; i++) {
        it(`should convert valid name: ${validNames[i]}`, async () => {
            const data = (await contract.getStringToInternal(validNames[i]))!;
            const received = data.beginParse().loadBuffer(data.bits.length / 8).toString('hex');
            expect(received).toBe(convertToInternal(validNames[i].endsWith('.') && validNames[i] !== '.' ? validNames[i].slice(0, validNames[i].length - 1) : validNames[i]).toString('hex'));
        });
    }

    for (let i = 0; i < validNames.length; i++) {
        if (validNames[i] !== '.') {
            it(`should convert valid name: ${validNames[i]}`, async () => {
                const data = (await contract.getStringToInternal(validNames[i]))!;
                expect(await contract.getDnsInternalVerify(data)).toBe(true);
            });
        }
    }

    for (let i = 0; i < equalNormalized.length; i++) {
        it(`should convert equal normalized names: ${equalNormalized[i][0]} ${equalNormalized[i][1]}`, async () => {
            let data1 = (await contract.getStringToInternal(equalNormalized[i][0]))!;
            data1 = await contract.getInternalNormalize(data1);
            const received1 = data1.beginParse().loadBuffer(data1.bits.length / 8).toString('hex');
            let data2 = (await contract.getStringToInternal(equalNormalized[i][1]))!;
            data2 = await contract.getInternalNormalize(data2);
            const received2 = data2.beginParse().loadBuffer(data2.bits.length / 8).toString('hex');
            expect(received1).toBe(received2);
            expect(received1.length).toBe(received2.length);
        });
    }
    for (let i = 0; i < notEqualNormalized.length; i++) {
        it(`should convert not equal normalized names: ${notEqualNormalized[i][0]} ${notEqualNormalized[i][1]}`, async () => {
            let data1 = (await contract.getStringToInternal(notEqualNormalized[i][0]))!;
            data1 = await contract.getInternalNormalize(data1);
            const received1 = data1.beginParse().loadBuffer(data1.bits.length / 8).toString('hex');
            let data2 = (await contract.getStringToInternal(notEqualNormalized[i][1]))!;
            data2 = await contract.getInternalNormalize(data2);
            const received2 = data2.beginParse().loadBuffer(data2.bits.length / 8).toString('hex');
            expect(received1).not.toBe(received2);
            expect(received1.length).toBe(received2.length);
        });
    }

    for (let i = 0; i < validNames.length; i++) {
        it('should resolve name ' + validNames[i], async () => {
            const internalAddress = convertToInternal(validNames[i]);
            const resolved = (await contract.getDnsresolve(beginCell().storeBuffer(internalAddress).endCell(), 1n))!;
            expect(resolved.prefix).toBe(BigInt(internalAddress.length * 8));
            if (validNames[i] === '.') {
                expect(resolved.record!.bits.length).toBe(0);
                expect(resolved.record!.refs.length).toBe(0);
            } else if (validNames[i].endsWith('.')) {
                expect(resolved.record!.beginParse().loadBuffer(internalAddress.length - 1).toString('hex')).toBe(internalAddress.subarray(1).toString('hex'));
            } else {
                expect(resolved.record!.beginParse().loadBuffer(internalAddress.length).toString('hex')).toBe(internalAddress.toString('hex'));
            }
        });
    }

    for (let i = 0; i < invalidNames.length; i++) {
        it('should not resolve name ' + invalidNames[i], async () => {
            const internalAddress = convertToInternal(invalidNames[i]);
            await expect(contract.getDnsresolve(beginCell().storeBuffer(internalAddress).endCell(), 1n)).rejects.toThrowError();
        });
    }

    for (let i = 0; i < validNames.length; i++) {
        if (validNames[i].endsWith('.')) {
            continue;
        }
        it('should resolve name with leading zero ' + validNames[i], async () => {
            const internalAddress = convertToInternal(validNames[i]);
            const resolved = (await contract.getDnsresolve(beginCell().storeBuffer(Buffer.concat([Buffer.alloc(1, 0), internalAddress])).endCell(), 1n))!;
            expect(resolved.prefix).toBe(BigInt(internalAddress.length * 8 + 8));
            if (validNames[i] === '.') {
                expect(resolved.record!.bits.length).toBe(0);
                expect(resolved.record!.refs.length).toBe(0);
            } else {
                expect(resolved.record!.beginParse().loadBuffer(internalAddress.length).toString('hex')).toBe(internalAddress.toString('hex'));
            }
        });
    }
});