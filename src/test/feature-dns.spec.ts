import { OpenedContract, toNano } from 'ton-core';
import { ContractSystem } from '@tact-lang/emulator';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { DNSTester } from './features/output/dns_DNSTester';

function convertToInternal(src: string) {
    if (src === '.') {
        return '00';
    }
    let parts = src.split('.').map((x) => Buffer.from(x));
    let res = Buffer.alloc(0);
    for (let i = 0; i < parts.length; i++) {
        if (res.length > 0) {
            res = Buffer.concat([res, Buffer.from([0])]);
        }
        res = Buffer.concat([res, parts[parts.length - i - 1]]);
    }
    return res.toString('hex');
}

describe('feature-dns', () => {

    let contract: OpenedContract<DNSTester>;

    beforeEach(async () => {
        __DANGER_resetNodeId();
        let system = await ContractSystem.create();
        let treasure = system.treasure('treasure');
        contract = system.open(await DNSTester.fromInit());
        await contract.send(treasure, { value: toNano('10') }, { $$type: 'Deploy', queryId: 0n });
        await system.run();
    });

    const invalidNames = [
        '..',
        'a..b',
        'a.b..c',
        'a.b.c.',
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
        });
    }

    for (let i = 0; i < validNames.length; i++) {
        it(`should convert valid name: ${validNames[i]}`, async () => {
            let data = (await contract.getStringToInternal(validNames[i]))!;
            let received = data.beginParse().loadBuffer(data.bits.length / 8).toString('hex');
            expect(received).toBe(convertToInternal(validNames[i]));
        });
    }

    for (let i = 0; i < equalNormalized.length; i++) {
        it(`should convert equal normalized names: ${equalNormalized[i][0]} ${equalNormalized[i][1]}`, async () => {
            let data1 = (await contract.getStringToInternal(equalNormalized[i][0]))!;
            data1 = await contract.getInternalNormalize(data1);
            let received1 = data1.beginParse().loadBuffer(data1.bits.length / 8).toString('hex');
            let data2 = (await contract.getStringToInternal(equalNormalized[i][1]))!;
            data2 = await contract.getInternalNormalize(data2);
            let received2 = data2.beginParse().loadBuffer(data2.bits.length / 8).toString('hex');
            expect(received1).toBe(received2);
            expect(received1.length).toBe(received2.length);
        });
    }
    for (let i = 0; i < notEqualNormalized.length; i++) {
        it(`should convert not equal normalized names: ${notEqualNormalized[i][0]} ${notEqualNormalized[i][1]}`, async () => {
            let data1 = (await contract.getStringToInternal(notEqualNormalized[i][0]))!;
            data1 = await contract.getInternalNormalize(data1);
            let received1 = data1.beginParse().loadBuffer(data1.bits.length / 8).toString('hex');
            let data2 = (await contract.getStringToInternal(notEqualNormalized[i][1]))!;
            data2 = await contract.getInternalNormalize(data2);
            let received2 = data2.beginParse().loadBuffer(data2.bits.length / 8).toString('hex');
            expect(received1).not.toBe(received2);
            expect(received1.length).toBe(received2.length);
        });
    }
});