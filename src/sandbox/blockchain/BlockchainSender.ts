import type { Address, Message, Sender, SenderArguments } from "@/core";
import { Cell, packExtraCurrencyDict } from "@/core";

/**
 * Sender for sandbox blockchain. For additional information see {@link Blockchain.sender}
 */
export class BlockchainSender implements Sender {
    constructor(
        private readonly blockchain: {
            pushMessage(message: Message): Promise<void>;
        },
        readonly address: Address,
    ) {}

    async send(args: SenderArguments) {
        await this.blockchain.pushMessage({
            info: {
                type: "internal",
                ihrDisabled: true,
                ihrFee: 0n,
                bounce: args.bounce ?? true,
                bounced: false,
                src: this.address,
                dest: args.to,
                value: {
                    coins: args.value,
                    other: args.extracurrency
                        ? packExtraCurrencyDict(args.extracurrency)
                        : undefined,
                },
                forwardFee: 0n,
                createdAt: 0,
                createdLt: 0n,
            },
            body: args.body ?? new Cell(),
        });
    }
}
