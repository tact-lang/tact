import { SampleJetton, SampleJetton_init } from "./output/jetton_SampleJetton";
import { createExecutorFromCode } from "ton-nodejs";
import { randomAddress } from "../src/test/utils/randomAddress";
import { Address, beginCell, Cell, contractAddress, StateInit, toNano } from "ton";
import BN from "bn.js";
import qs from 'qs';

function toUrlSafe(src: string) {
    while (src.indexOf('/') >= 0) {
        src = src.replace('/', '_');
    }
    while (src.indexOf('+') >= 0) {
        src = src.replace('+', '-');
    }
    while (src.indexOf('=') >= 0) {
        src = src.replace('=', '');
    }
    return src;
}

export function printDeploy(init: { code: Cell, data: Cell }, amount: BN, command: Cell | string, testnet: boolean = true) {

    // Resolve target address
    let to = contractAddress({ workchain: 0, initialCode: init.code, initialData: init.data });

    // Resovle init
    let cell = new Cell();
    new StateInit(init).writeTo(cell);
    let initStr = toUrlSafe(cell.toBoc({ idx: false }).toString("base64"));

    let link: string;
    if (typeof command === 'string') {
        link = `https://app.tonkeeper.com/transfer/` + to.toFriendly({ testOnly: testnet }) + "?" + qs.stringify({
            text: command,
            amount: amount.toString(10),
            init: initStr
        });
    } else {
        link = `https://app.tonkeeper.com/transfer/` + to.toFriendly({ testOnly: testnet }) + "?" + qs.stringify({
            text: "Deploy contract",
            amount: amount.toString(10),
            init: initStr,
            bin: toUrlSafe(command.toBoc({ idx: false }).toString('base64')),
        });
    }
    console.warn("Deploy: " + link);
}

describe('jetton', () => {
    it('should deploy', async () => {

        // Create jetton
        let owner = randomAddress(0, 'jetton-owner');
        let init = await SampleJetton_init(owner, null);
        let executor = await createExecutorFromCode(init);
        let contract = new SampleJetton(executor);

        // Check owner
        expect((await contract.getOwner()).toFriendly()).toEqual(owner.toFriendly());

        // Mint
        let res = await contract.send({ amount: toNano(1) }, { $$type: 'Mint', amount: new BN(1000000) });
        // console.warn(res);

        // Data
        let data = await contract.getGetJettonData();
        // console.warn(data);
    });

    it('deploy to testnet', async () => {
        let link = 'ipfs://QmYHH1rhQZZKSwMp5TxTn8wvjuKzmHDJYeRSTcGJDMBXn5';
        let owner = Address.parse('kQD6oPnzaaAMRW24R8F0_nlSsJQni0cGHntR027eT9_sgtwt');
        let data = beginCell()
            .storeUint8(1)
            .storeBuffer(Buffer.from(link))
            .endCell();
        let init = await SampleJetton_init(owner, data);
        printDeploy(init, toNano(1), 'Deploy', true);
    });
});