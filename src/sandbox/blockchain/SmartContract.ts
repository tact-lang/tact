import type { Blockchain } from "@/sandbox/blockchain/Blockchain";
import type {
    Account,
    Address,
    Message,
    ShardAccount,
    Transaction,
    TupleItem,
} from "@/core";
import {
    beginCell,
    Cell,
    contractAddress,
    Dictionary,
    loadShardAccount,
    loadTransaction,
    parseTuple,
    storeMessage,
    storeShardAccount,
    TupleReader,
} from "@/core";
import type { ExtraCurrency } from "@/sandbox/utils/ec";
import { extractEc, packEc } from "@/sandbox/utils/ec";
import { getSelectorForMethod } from "@/sandbox/utils/selector";
import type {
    EmulationResult,
    ExecutorVerbosity,
    RunCommonArgs,
    TickOrTock,
} from "@/sandbox/executor/Executor";

export function createShardAccount(args: {
    address?: Address;
    code: Cell;
    data: Cell;
    balance: bigint;
    workchain?: number;
}): ShardAccount {
    const wc = args.workchain ?? 0;
    const address =
        args.address ??
        contractAddress(wc, { code: args.code, data: args.data });
    // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
    const balance = args.balance ?? 0n;

    return {
        account: {
            addr: address,
            storage: {
                lastTransLt: 0n,
                balance: { coins: balance },
                state: {
                    type: "active",
                    state: {
                        code: args.code,
                        data: args.data,
                    },
                },
            },
            storageStats: {
                used: {
                    cells: 0n,
                    bits: 0n,
                    publicCells: 0n,
                },
                lastPaid: 0,
                duePayment: null,
            },
        },
        lastTransactionLt: 0n,
        lastTransactionHash: 0n,
    };
}

function createEmptyAccount(address: Address): Account {
    return {
        addr: address,
        storage: {
            lastTransLt: 0n,
            balance: { coins: 0n },
            state: { type: "uninit" },
        },
        storageStats: {
            used: { cells: 0n, bits: 0n, publicCells: 0n },
            lastPaid: 0,
        },
    };
}

export function createEmptyShardAccount(address: Address): ShardAccount {
    return {
        account: createEmptyAccount(address),
        lastTransactionLt: 0n,
        lastTransactionHash: 0n,
    };
}

export type Verbosity =
    | "none"
    | "vm_logs"
    | "vm_logs_location"
    | "vm_logs_gas"
    | "vm_logs_full"
    | "vm_logs_verbose";

const verbosityToExecutorVerbosity: Record<Verbosity, ExecutorVerbosity> = {
    none: "short",
    vm_logs: "full",
    vm_logs_location: "full_location",
    vm_logs_gas: "full_location_gas",
    vm_logs_full: "full_location_stack",
    vm_logs_verbose: "full_location_stack_verbose",
};

export type LogsVerbosity = {
    print: boolean;
    blockchainLogs: boolean;
    vmLogs: Verbosity;
    debugLogs: boolean;
};

export type SmartContractTransaction = Transaction & {
    blockchainLogs: string;
    vmLogs: string;
    debugLogs: string;
    oldStorage?: Cell;
    newStorage?: Cell;
};
export type MessageParams = Partial<{
    now: number;
    randomSeed: Buffer;
    ignoreChksig: boolean;
}>;

export type GetMethodParams = Partial<{
    now: number;
    randomSeed: Buffer;
    gasLimit: bigint;
}>;

export type GetMethodResult = {
    stack: TupleItem[];
    stackReader: TupleReader;
    exitCode: number;
    gasUsed: bigint;
    blockchainLogs: string;
    vmLogs: string;
    debugLogs: string;
};

export class GetMethodError extends Error {
    constructor(
        public exitCode: number,
        public gasUsed: bigint,
        public blockchainLogs: string,
        public vmLogs: string,
        public debugLogs: string,
    ) {
        super(`Unable to execute get method. Got exit_code: ${exitCode}`);
    }
}

export class TimeError extends Error {
    constructor(
        public address: Address,
        public previousTxTime: number,
        public currentTime: number,
    ) {
        super(
            // eslint-disable-next-line @typescript-eslint/restrict-template-expressions
            `Cannot run a transaction on account ${address} at unix timestamp ${currentTime} because it already had a transaction executed on it at unix timestamp ${previousTxTime}`,
        );
    }
}

export class EmulationError extends Error {
    constructor(
        public error: string,
        public vmLogs?: string,
        public exitCode?: number,
        public blockchainLogs?: string,
        public debugLogs?: string,
    ) {
        let errMsg = `Error while executing transaction: ${error}`;
        if (exitCode !== undefined) {
            errMsg += `\nExit code: ${exitCode}`;
        }
        if (vmLogs !== undefined) {
            errMsg += `\nVM logs:\n${vmLogs}`;
        }
        if (blockchainLogs !== undefined) {
            errMsg += `\nBlockchain logs:\n${blockchainLogs}`;
        }
        if (debugLogs !== undefined) {
            errMsg += `\nDebug logs:\n${debugLogs}`;
        }
        super(errMsg);
    }
}

export type SmartContractSnapshot = {
    address: Address;
    account: ShardAccount;
    lastTxTime: number;
    verbosity?: Partial<LogsVerbosity>;
};

export class SmartContract {
    readonly address: Address;
    readonly blockchain: Blockchain;
    #account: string;
    #parsedAccount?: ShardAccount;
    #lastTxTime: number;
    #verbosity?: Partial<LogsVerbosity>;

    constructor(shardAccount: ShardAccount, blockchain: Blockchain) {
        this.address = shardAccount.account!.addr;
        this.#account = beginCell()
            .store(storeShardAccount(shardAccount))
            .endCell()
            .toBoc()
            .toString("base64");
        this.#parsedAccount = shardAccount;
        this.#lastTxTime = shardAccount.account?.storageStats.lastPaid ?? 0;
        this.blockchain = blockchain;
    }

    snapshot(): SmartContractSnapshot {
        return {
            address: this.address,
            account: this.account,
            lastTxTime: this.#lastTxTime,
            verbosity:
                this.#verbosity === undefined
                    ? undefined
                    : { ...this.#verbosity },
        };
    }

    loadFrom(snapshot: SmartContractSnapshot) {
        if (snapshot.address !== this.address) {
            throw new Error("Wrong snapshot address");
        }

        this.account = snapshot.account;
        this.#lastTxTime = snapshot.lastTxTime;
        this.#verbosity =
            snapshot.verbosity === undefined
                ? undefined
                : { ...snapshot.verbosity };
    }

    get ec() {
        return extractEc(
            this.account.account?.storage.balance.other ??
                Dictionary.empty(
                    Dictionary.Keys.Uint(32),
                    Dictionary.Values.BigVarUint(5),
                ),
        );
    }

    set ec(nv: ExtraCurrency) {
        const acc = this.account;
        if (acc.account === undefined) {
            acc.account = createEmptyAccount(this.address);
        }
        acc.account!.storage.balance.other = packEc(
            Object.entries(nv).map(([k, v]) => [Number(k), v]),
        );
        this.account = acc;
    }

    get balance() {
        return this.account.account?.storage.balance.coins ?? 0n;
    }

    set balance(v: bigint) {
        const acc = this.account;
        if (acc.account === undefined) {
            acc.account = createEmptyAccount(this.address);
        }
        acc.account!.storage.balance.coins = v;
        this.account = acc;
    }

    get lastTransactionHash() {
        return this.account.lastTransactionHash;
    }

    get lastTransactionLt() {
        return this.account.lastTransactionLt;
    }

    get accountState() {
        return this.account.account?.storage.state;
    }

    get account() {
        if (this.#parsedAccount === undefined) {
            this.#parsedAccount = loadShardAccount(
                Cell.fromBase64(this.#account).beginParse(),
            );
        }
        return this.#parsedAccount;
    }

    set account(account: ShardAccount) {
        this.#account = beginCell()
            .store(storeShardAccount(account))
            .endCell()
            .toBoc()
            .toString("base64");
        this.#parsedAccount = account;
        this.#lastTxTime = account.account?.storageStats.lastPaid ?? 0;
    }

    static create(
        blockchain: Blockchain,
        args: { address: Address; code: Cell; data: Cell; balance: bigint },
    ) {
        return new SmartContract(createShardAccount(args), blockchain);
    }

    static empty(blockchain: Blockchain, address: Address) {
        return new SmartContract(createEmptyShardAccount(address), blockchain);
    }

    protected createCommonArgs(params?: MessageParams): RunCommonArgs {
        const now = params?.now ?? Math.floor(Date.now() / 1000);

        if (now < this.#lastTxTime) {
            throw new TimeError(this.address, this.#lastTxTime, now);
        }

        return {
            config: this.blockchain.configBase64,
            libs: this.blockchain.libs ?? null,
            verbosity: verbosityToExecutorVerbosity[this.verbosity.vmLogs],
            shardAccount: this.#account,
            now,
            lt: this.blockchain.lt,
            randomSeed: params?.randomSeed ?? Buffer.alloc(32),
            ignoreChksig: params?.ignoreChksig ?? false,
            debugEnabled: this.verbosity.debugLogs,
        };
    }

    async receiveMessage(message: Message, params?: MessageParams) {
        // Sync now with blockchain instance if not specified in parameters
        params = {
            now: this.blockchain.now,
            ...params,
        };
        return await this.runCommon(() =>
            this.blockchain.executor.runTransaction({
                ...this.createCommonArgs(params),
                message: beginCell().store(storeMessage(message)).endCell(),
            }),
        );
    }

    async runTickTock(which: TickOrTock, params?: MessageParams) {
        return await this.runCommon(() =>
            this.blockchain.executor.runTickTock({
                ...this.createCommonArgs(params),
                which,
            }),
        );
    }

    protected async runCommon(
        run: () => Promise<EmulationResult>,
    ): Promise<SmartContractTransaction> {
        let oldStorage: Cell | undefined = undefined;
        if (
            this.blockchain.recordStorage &&
            this.account.account?.storage.state.type === "active"
        ) {
            oldStorage =
                this.account.account.storage.state.state.data ?? undefined;
        }

        const res = await run();

        if (
            this.verbosity.print &&
            this.verbosity.blockchainLogs &&
            res.logs.length > 0
        ) {
            console.log(res.logs);
        }

        if (!res.result.success) {
            throw new EmulationError(
                res.result.error,
                res.result.vmResults?.vmLog,
                res.result.vmResults?.vmExitCode,
                res.logs.length === 0 ? undefined : res.logs,
                res.debugLogs.length === 0 ? undefined : res.debugLogs,
            );
        }

        if (
            this.verbosity.print &&
            this.verbosity.vmLogs !== "none" &&
            res.result.vmLog.length > 0
        ) {
            console.log(res.result.vmLog);
        }

        if (
            this.verbosity.print &&
            this.verbosity.debugLogs &&
            res.debugLogs.length > 0
        ) {
            console.log(res.debugLogs);
        }

        const tx = loadTransaction(
            Cell.fromBase64(res.result.transaction).beginParse(),
        );

        this.#account = res.result.shardAccount;
        this.#parsedAccount = undefined;
        this.#lastTxTime = tx.now;

        let newStorage: Cell | undefined = undefined;
        if (
            this.blockchain.recordStorage &&
            this.account.account?.storage.state.type === "active"
        ) {
            newStorage =
                this.account.account.storage.state.state.data ?? undefined;
        }

        return {
            ...tx,
            blockchainLogs: res.logs,
            vmLogs: res.result.vmLog,
            debugLogs: res.debugLogs,
            oldStorage,
            newStorage,
        };
    }

    async get(
        method: string | number,
        stack: TupleItem[] = [],
        params?: GetMethodParams,
    ): Promise<GetMethodResult> {
        if (this.account.account?.storage.state.type !== "active") {
            throw new Error("Trying to run get method on non-active contract");
        }

        const res = await this.blockchain.executor.runGetMethod({
            code: this.account.account.storage.state.state.code!,
            data: this.account.account.storage.state.state.data!,
            methodId:
                typeof method === "string"
                    ? getSelectorForMethod(method)
                    : method,
            stack,
            config: this.blockchain.configBase64,
            verbosity: verbosityToExecutorVerbosity[this.verbosity.vmLogs],
            libs: this.blockchain.libs,
            address: this.address,
            unixTime: params?.now ?? Math.floor(Date.now() / 1000),
            balance: this.balance,
            randomSeed: params?.randomSeed ?? Buffer.alloc(32),
            gasLimit: params?.gasLimit ?? 10_000_000n,
            debugEnabled: this.verbosity.debugLogs,
            extraCurrency: this.ec,
        });

        if (
            this.verbosity.print &&
            this.verbosity.blockchainLogs &&
            res.logs.length > 0
        ) {
            console.log(res.logs);
        }

        if (!res.output.success) {
            throw new Error("Error invoking get method: " + res.output.error);
        }

        if (
            this.verbosity.print &&
            this.verbosity.vmLogs !== "none" &&
            res.output.vm_log.length > 0
        ) {
            console.log(res.output.vm_log);
        }

        if (
            this.verbosity.print &&
            this.verbosity.debugLogs &&
            res.debugLogs.length > 0
        ) {
            console.log(res.debugLogs);
        }

        if (res.output.vm_exit_code !== 0 && res.output.vm_exit_code !== 1) {
            throw new GetMethodError(
                res.output.vm_exit_code,
                BigInt(res.output.gas_used),
                res.logs,
                res.output.vm_log,
                res.debugLogs,
            );
        }

        const resStack = parseTuple(Cell.fromBase64(res.output.stack));

        return {
            stack: resStack,
            stackReader: new TupleReader(resStack),
            exitCode: res.output.vm_exit_code,
            gasUsed: BigInt(res.output.gas_used),
            blockchainLogs: res.logs,
            vmLogs: res.output.vm_log,
            debugLogs: res.debugLogs,
        };
    }

    get verbosity() {
        return {
            ...this.blockchain.verbosity,
            ...this.#verbosity,
        };
    }

    set verbosity(value: LogsVerbosity) {
        this.setVerbosity(value);
    }

    setVerbosity(verbosity: Partial<LogsVerbosity> | Verbosity | undefined) {
        if (typeof verbosity === "string") {
            this.#verbosity = {
                ...this.#verbosity,
                vmLogs: verbosity,
                blockchainLogs: verbosity !== "none",
            };
        } else {
            this.#verbosity = verbosity;
        }
    }
}
