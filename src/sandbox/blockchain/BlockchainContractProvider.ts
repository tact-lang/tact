import type {
    AccountState,
    Address,
    Cell,
    Contract,
    ContractGetMethodResult,
    ContractProvider,
    ContractState,
    ExtraCurrency,
    Message,
    OpenedContract,
    Sender,
    SendMode,
    StateInit,
    Transaction,
    TupleItem,
} from "@/core";
import { comment, toNano } from "@/core";
import type { TickOrTock } from "@/sandbox/executor/Executor";
import type {
    GetMethodResult,
    SmartContract,
} from "@/sandbox/blockchain/SmartContract";

function bigintToBuffer(x: bigint, n = 32): Buffer {
    const b = Buffer.alloc(n);
    for (let i = 0; i < n; i++) {
        b[n - i - 1] = Number((x >> BigInt(i * 8)) & 0xffn);
    }
    return b;
}

function convertState(state: AccountState | undefined): ContractState["state"] {
    if (state === undefined)
        return {
            type: "uninit",
        };

    switch (state.type) {
        case "uninit":
            return {
                type: "uninit",
            };
        case "active":
            return {
                type: "active",
                code: state.state.code?.toBoc(),
                data: state.state.data?.toBoc(),
            };
        case "frozen":
            return {
                type: "frozen",
                stateHash: bigintToBuffer(state.stateHash),
            };
    }
}

export interface SandboxContractProvider extends ContractProvider {
    tickTock(which: TickOrTock): Promise<void>;
}

/**
 * Provider used in contracts to send messages or invoke getters. For additional information see {@link Blockchain.provider}
 */
export class BlockchainContractProvider implements SandboxContractProvider {
    constructor(
        private readonly blockchain: {
            getContract(address: Address): Promise<SmartContract>;
            pushMessage(message: Message): Promise<void>;
            runGetMethod(
                address: Address,
                method: string,
                args: TupleItem[],
            ): Promise<GetMethodResult>;
            pushTickTock(on: Address, which: TickOrTock): Promise<void>;
            openContract<T extends Contract>(contract: T): OpenedContract<T>;
        },
        private readonly address: Address,
        private readonly init?: StateInit | null,
    ) {}

    /**
     * Opens contract. For additional information see {@link Blockchain.open}
     */
    open<T extends Contract>(contract: T): OpenedContract<T> {
        return this.blockchain.openContract(contract);
    }

    async getState(): Promise<ContractState> {
        const contract = await this.blockchain.getContract(this.address);
        return {
            balance: contract.balance,
            extracurrency: contract.ec,
            last: {
                lt: contract.lastTransactionLt,
                hash: bigintToBuffer(contract.lastTransactionHash),
            },
            state: convertState(contract.accountState),
        };
    }

    /**
     * Invokes get method.
     * @param name Name of get method
     * @param args Args to invoke get method.
     */
    async get(
        name: string,
        args: TupleItem[],
    ): Promise<ContractGetMethodResult> {
        const result = await this.blockchain.runGetMethod(
            this.address,
            name,
            args,
        );
        const ret = {
            ...result,
            stack: result.stackReader,
            stackItems: result.stack,
            logs: result.vmLogs,
        };
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        delete (ret as any).stackReader;
        return ret;
    }

    /**
     * Dummy implementation of getTransactions. Sandbox does not store transactions, so its ContractProvider cannot fetch any.
     * Throws error in every call.
     *
     * @throws {Error}
     */
    getTransactions(
        _address: Address,
        _lt: bigint,
        _hash: Buffer,
        _limit?: number,
    ): Promise<Transaction[]> {
        throw new Error(
            "`getTransactions` is not implemented in `BlockchainContractProvider`, do not use it in the tests",
        );
    }

    /**
     * Pushes external-in message to message queue.
     * @param message Message to push
     */
    async external(message: Cell) {
        const init =
            (await this.getState()).state.type !== "active" && this.init
                ? this.init
                : undefined;

        await this.blockchain.pushMessage({
            info: {
                type: "external-in",
                dest: this.address,
                importFee: 0n,
            },
            init,
            body: message,
        });
    }

    /**
     * Pushes internal message to message queue.
     */
    async internal(
        via: Sender,
        args: {
            value: string | bigint;
            extracurrency?: ExtraCurrency;
            bounce?: boolean | null;
            sendMode?: SendMode;
            body?: string | Cell | null;
        },
    ) {
        const init =
            (await this.getState()).state.type !== "active" && this.init
                ? this.init
                : undefined;

        const bounce = args.bounce ?? true;

        const value =
            typeof args.value === "string" ? toNano(args.value) : args.value;

        const body =
            typeof args.body === "string" ? comment(args.body) : args.body;

        await via.send({
            to: this.address,
            value,
            bounce,
            extracurrency: args.extracurrency,
            sendMode: args.sendMode,
            init,
            body,
        });
    }

    /**
     * Pushes tick-tock message to message queue.
     */
    async tickTock(which: TickOrTock) {
        await this.blockchain.pushTickTock(this.address, which);
    }
}
