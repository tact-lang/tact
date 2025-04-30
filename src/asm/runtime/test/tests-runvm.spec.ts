import {
    ADD,
    BLKDROP,
    compileCell,
    DICTIGETJMPZ,
    DROP,
    DUMP,
    DUMPSTK,
    NEQ,
    DICTPUSHCONST,
    PUSHINT,
    PUSHINT_8,
    SETCP,
    THROW,
    THROWARG,
} from "../index";
import {
    Address,
    Cell,
    Contract,
    contractAddress,
    ContractProvider,
    Sender,
    StateInit,
    toNano,
} from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { call, measureGas2, when } from "../../helpers/helpers";
import { dictMap } from "../util";

describe("runvm-helper", () => {
    it(`should correctly execute instructions inside runvm`, async () => {
        const blockchain: Blockchain = await Blockchain.create();
        // blockchain.verbosity.vmLogs = "vm_logs"
        const treasure: SandboxContract<TreasuryContract> =
            await blockchain.treasury("treasure");

        const instructions = [
            SETCP(0),
            DICTPUSHCONST(
                19,
                dictMap(
                    new Map([
                        // prettier-ignore
                        [0, [
                        BLKDROP(4),

                        ...measureGas2([
                            PUSHINT(1),
                            PUSHINT(2),
                            ADD(),
                            DROP(),
                        ]),
                        DUMP(0),

                        ...when(call(NEQ(), PUSHINT_8(72)), [
                            THROW(10),
                        ]),

                        DUMPSTK(),
                    ]],
                    ]),
                ),
            ),
            DICTIGETJMPZ(),
            THROWARG(11),
        ];

        const init: StateInit = {
            code: compileCell(instructions),
            data: new Cell(),
        };

        const address = contractAddress(0, init);
        const contract = new TestContract(address, init);

        const openContract = blockchain.openContract(contract);

        // Deploy
        await openContract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            new Cell(),
        );
    });
});

export class TestContract implements Contract {
    public readonly address: Address;
    public readonly init?: StateInit;

    public constructor(address: Address, init?: StateInit) {
        this.address = address;
        this.init = init;
    }

    public async send(
        provider: ContractProvider,
        via: Sender,
        args: { value: bigint; bounce?: boolean | null | undefined },
        body: Cell,
    ) {
        await provider.internal(via, { ...args, body: body });
    }
}
