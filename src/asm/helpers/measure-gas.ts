import * as i from "@/asm/runtime";
import type {
    Address,
    Contract,
    ContractProvider,
    Sender,
    StateInit,
    TupleReader,
} from "@ton/core";
import { contractAddress, toNano, TupleBuilder, Cell } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { measureGas2 } from "@/asm/helpers/helpers";

export const measureGas = async (code: i.Instr[]): Promise<number> => {
    class TestContract implements Contract {
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

        public async getAny(
            provider: ContractProvider,
            id: number,
        ): Promise<TupleReader> {
            const builder = new TupleBuilder();
            const result = await provider.get(id, builder.build());
            return result.stack;
        }
    }

    const blockchain: Blockchain = await Blockchain.create();
    // blockchain.verbosity.vmLogs = "vm_logs"
    const treasure: SandboxContract<TreasuryContract> =
        await blockchain.treasury("treasure");

    const instructions = [
        i.SETCP(0),
        i.DICTPUSHCONST(
            19,
            i.util.dictMap(
                new Map([
                    // prettier-ignore
                    [0, [
                    ...measureGas2(code),
                    i.SWAP(),
                ]],
                    [1, [i.PUSHINT(1), i.PUSHINT(2), i.ADD()]],
                ]),
            ),
        ),
        i.DICTIGETJMPZ(),
        i.THROWARG(11),
    ];

    const init: StateInit = {
        code: i.compileCell(instructions),
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

    const data = await openContract.getAny(0);
    return data.readNumber();
};
