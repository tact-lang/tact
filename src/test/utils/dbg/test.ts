import { Address, beginCell, Builder, Cell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";

import { JettonMinter } from "../../benchmarks/contracts/output/jetton_minter_discoverable_JettonMinter";
import { JettonWallet } from "../../benchmarks/contracts/output/jetton_minter_discoverable_JettonWallet";
import { withLog } from "../with-log";

const main = async () => {
    const blockchain = await Blockchain.create();
    const deployer = await blockchain.treasury("deployer");
    const jettonMinter = await blockchain.openContract(
        await JettonMinter.fromInit(deployer.address, beginCell().endCell()),
    );
    await jettonMinter.send(
        deployer.getSender(),
        { value: toNano("0.1") },
        {
            $$type: "TokenUpdateContent",
            content: new Cell(),
        },
    );
    await blockchain.openContract(
        await JettonWallet.fromInit(deployer.address, jettonMinter.address),
    );
    await jettonMinter.send(
        deployer.getSender(),
        { value: toNano("1") + toNano("0.015") },
        {
            $$type: "Mint",
            amount: toNano(100000),
            receiver: deployer.address,
        }
    );
    const deployerJettonWallet = await blockchain.openContract(
        await JettonWallet.fromInit(deployer.address, jettonMinter.address),
    );
    const someAddress = Address.parse(
        "EQD__________________________________________0vo",
    );
    const { transactions } = await withLog(blockchain, () =>
        deployerJettonWallet.send(deployer.getSender(), { value: toNano(1) }, {
            $$type: "TokenTransfer",
            query_id: 0n,
            amount: 1n,
            destination: someAddress,
            response_destination: deployer.address,
            custom_payload: null,
            forward_ton_amount: 0n,
            forward_payload: new Builder().storeUint(0, 1).endCell().beginParse(),
        }),
    );
    console.log(JSON.stringify(transactions, null, 4));
};

void main();