import * as i from "../runtime"
import {Instr} from "../runtime"
import {
    Address,
    Cell,
    Contract,
    contractAddress,
    ContractProvider,
    Sender,
    StateInit,
    toNano,
    TupleBuilder,
    TupleReader,
} from "@ton/core"
import {Blockchain, SandboxContract, TreasuryContract} from "@ton/sandbox"

export const executeInstructions = async (
    code: Instr[],
    id: number = 0,
): Promise<[TupleReader, string]> => {
    class TestContract implements Contract {
        public readonly address: Address
        public readonly init?: StateInit

        public constructor(address: Address, init?: StateInit) {
            this.address = address
            this.init = init
        }

        public async send(
            provider: ContractProvider,
            via: Sender,
            args: {value: bigint; bounce?: boolean | null | undefined},
            body: Cell,
        ) {
            await provider.internal(via, {...args, body: body})
        }

        public async getAny(
            provider: ContractProvider,
            id: number,
        ): Promise<[TupleReader, string]> {
            const builder = new TupleBuilder()
            const res = await provider.get(id, builder.build())

            // @ts-expect-error TS2551
            return [res.stack, res.vmLogs]
        }
    }

    const blockchain: Blockchain = await Blockchain.create()
    blockchain.verbosity.print = false
    blockchain.verbosity.vmLogs = "vm_logs_verbose"
    const treasure: SandboxContract<TreasuryContract> = await blockchain.treasury("treasure")

    const init: StateInit = {
        code: i.compileCell(code),
        data: new Cell(),
    }

    const address = contractAddress(0, init)
    const contract = new TestContract(address, init)

    const openContract = blockchain.openContract(contract)

    // Deploy
    await openContract.send(
        treasure.getSender(),
        {
            value: toNano("10"),
        },
        new Cell(),
    )

    return openContract.getAny(id)
}
