import type { AccountState, Address } from "@/core";
import { Cell } from "@/core";
import { SmartContract } from "@/sandbox/blockchain/SmartContract";
import type { Blockchain } from "@/sandbox/blockchain/Blockchain";

/**
 * @interface BlockchainStorage Provides information about contracts by blockchain
 */
export interface BlockchainStorage {
    getContract(
        blockchain: Blockchain,
        address: Address,
    ): Promise<SmartContract>;
    knownContracts(): SmartContract[];
    clearKnownContracts(): void;
}

export class LocalBlockchainStorage implements BlockchainStorage {
    private contracts: Map<string, SmartContract> = new Map();

    // eslint-disable-next-line @typescript-eslint/require-await
    async getContract(blockchain: Blockchain, address: Address) {
        let existing = this.contracts.get(address.toString());
        if (!existing) {
            existing = SmartContract.empty(blockchain, address);
            this.contracts.set(address.toString(), existing);
        }

        return existing;
    }

    knownContracts() {
        return Array.from(this.contracts.values());
    }

    clearKnownContracts() {
        this.contracts.clear();
    }
}

export interface RemoteBlockchainStorageClient {
    getLastBlockSeqno(): Promise<number>;
    getAccount(
        seqno: number,
        address: Address,
    ): Promise<{
        state: AccountState;
        balance: bigint;
        lastTransaction?: { lt: bigint; hash: Buffer };
    }>;
}

function convertTonClient4State(
    state:
        | {
              type: "uninit";
          }
        | {
              type: "active";
              code: string | null;
              data: string | null;
          }
        | {
              type: "frozen";
              stateHash: string;
          },
): AccountState {
    switch (state.type) {
        case "uninit":
            return { type: "uninit" };
        case "active":
            return {
                type: "active",
                state: {
                    code:
                        state.code === null
                            ? undefined
                            : Cell.fromBase64(state.code),
                    data:
                        state.data === null
                            ? undefined
                            : Cell.fromBase64(state.data),
                },
            };
        case "frozen":
            return {
                type: "frozen",
                stateHash: BigInt(
                    "0x" +
                        Buffer.from(state.stateHash, "base64").toString("hex"),
                ),
            };
        default:
            // eslint-disable-next-line @typescript-eslint/restrict-template-expressions
            throw new Error(`Unknown type ${state}`);
    }
}

/**
 * Wraps ton client for remote storage.
 *
 * ```ts
 * let client = new TonClient4({
 *     endpoint: 'https://mainnet-v4.tonhubapi.com'
 * })
 *
 * let remoteStorageClient = wrapTonClient4ForRemote(client);
 * ```
 *
 * @param client TonClient4 to wrap
 */
export function wrapTonClient4ForRemote(client: {
    getLastBlock(): Promise<{
        last: {
            seqno: number;
        };
    }>;
    getAccount(
        seqno: number,
        address: Address,
    ): Promise<{
        account: {
            state:
                | {
                      type: "uninit";
                  }
                | {
                      type: "active";
                      code: string | null;
                      data: string | null;
                  }
                | {
                      type: "frozen";
                      stateHash: string;
                  };
            balance: {
                coins: string;
            };
            last: {
                lt: string;
                hash: string;
            } | null;
        };
    }>;
}): RemoteBlockchainStorageClient {
    return {
        getLastBlockSeqno: async () => {
            const last = await client.getLastBlock();
            return last.last.seqno;
        },
        getAccount: async (seqno: number, address: Address) => {
            const { account } = await client.getAccount(seqno, address);
            return {
                state: convertTonClient4State(account.state),
                balance: BigInt(account.balance.coins),
                lastTransaction:
                    account.last === null
                        ? undefined
                        : {
                              lt: BigInt(account.last.lt),
                              hash: Buffer.from(account.last.hash, "base64"),
                          },
            };
        },
    };
}

/**
 * @class {RemoteBlockchainStorage} Remote blockchain storage implementation.
 * ```ts
 * let client = new TonClient4({
 *     endpoint: 'https://mainnet-v4.tonhubapi.com'
 * })
 *
 * let blockchain = await Blockchain.create({
 *     storage: new RemoteBlockchainStorage(wrapTonClient4ForRemote(client), 34892000)
 * });
 * ```
 */
export class RemoteBlockchainStorage implements BlockchainStorage {
    private contracts: Map<string, SmartContract> = new Map();
    private client: RemoteBlockchainStorageClient;
    private blockSeqno?: number;

    constructor(client: RemoteBlockchainStorageClient, blockSeqno?: number) {
        this.client = client;
        this.blockSeqno = blockSeqno;
    }

    private async getLastBlockSeqno() {
        return this.blockSeqno ?? (await this.client.getLastBlockSeqno());
    }

    async getContract(blockchain: Blockchain, address: Address) {
        let existing = this.contracts.get(address.toString());
        if (!existing) {
            const blockSeqno = await this.getLastBlockSeqno();
            const account = await this.client.getAccount(blockSeqno, address);

            const lt = account.lastTransaction?.lt ?? 0n;

            existing = new SmartContract(
                {
                    lastTransactionHash: BigInt(
                        "0x" +
                            (account.lastTransaction?.hash.toString("hex") ??
                                "0"),
                    ),
                    lastTransactionLt: lt,
                    account: {
                        addr: address,
                        storageStats: {
                            used: {
                                cells: 0n,
                                bits: 0n,
                                publicCells: 0n,
                            },
                            lastPaid: 0,
                            duePayment: null,
                        },
                        storage: {
                            lastTransLt: lt === 0n ? 0n : lt + 1n,
                            balance: { coins: account.balance },
                            state: account.state,
                        },
                    },
                },
                blockchain,
            );

            this.contracts.set(address.toString(), existing);
        }

        return existing;
    }

    knownContracts() {
        return Array.from(this.contracts.values());
    }

    clearKnownContracts() {
        this.contracts.clear();
    }
}
