import {
    Address,
    Cell,
    ComputeSkipReason,
    Contract,
    fromNano,
    Message,
    Slice,
    Transaction,
} from "@ton/core";
import { SendMessageResult } from "@ton/sandbox";

export type TrackedEvent =
    | {
          $type: "deploy";
      }
    | {
          $type: "frozen";
      }
    | {
          $type: "deleted";
      }
    | {
          $type: "received";
          message: TrackedMessage;
      }
    | {
          $type: "received-bounced";
          message: TrackedMessage;
      }
    | {
          $type: "failed";
          errorCode: number;
          errorMessage?: string;
      }
    | {
          $type: "processed";
          gasUsed: bigint;
      }
    | {
          $type: "skipped";
          reason: ComputeSkipReason;
      }
    | {
          $type: "sent";
          messages: TrackedMessage[];
      }
    | {
          $type: "sent-bounced";
          message: TrackedMessage;
      }
    | {
          $type: "sent-bounced-failed";
      }
    | {
          $type: "storage-charged";
          amount: string;
      };

export type TrackedBody =
    | {
          type: "empty";
      }
    | {
          type: "cell";
          cell: string;
      }
    | {
          type: "text";
          text: string;
      }
    | {
          type: "known";
          value: unknown;
      };

export type TrackedMessage =
    | {
          type: "external-in";
          to: string;
          body: TrackedBody;
      }
    | {
          type: "external-out";
          to: string | null;
          body: TrackedBody;
      }
    | {
          type: "internal";
          from: string;
          to: string;
          value: string;
          bounce: boolean;
          body: TrackedBody;
      };

interface ContractWithParser extends Contract {
    parseMessage(slice: Slice): unknown;
}

export class Tracker {
    private _contracts: Map<string, ContractWithParser> = new Map();
    private _events: TrackedEvent[][] = [];

    reset() {
        this._contracts = new Map();
        this._events = [];
    }

    track(contract: ContractWithParser) {
        this._contracts.set(contract.address.toRawString(), contract);
    }

    collect() {
        const events = this._events;
        this._events = [];
        return events;
    }

    parseBody(src: Cell, addresses: Address[]): TrackedBody {
        const sc = src.beginParse();

        // Empty case
        if (sc.remainingBits === 0 && sc.remainingRefs === 0) {
            return { type: "empty" };
        }

        // Too short for op
        if (sc.remainingBits <= 32) {
            return { type: "cell", cell: src.toString() };
        }

        // If text
        if (sc.preloadUint(32) === 0) {
            return { type: "text", text: sc.loadStringTail() };
        }

        // If known
        for (const a of addresses) {
            const contract = this._contracts.get(a.toRawString());
            if (contract) {
                try {
                    return {
                        type: "known",
                        value: contract.parseMessage(sc),
                    };
                } catch (e) {
                    /* empty */
                }
            }
        }

        // Fallback
        return { type: "cell", cell: src.toString() };
    }

    parseMessage(src: Message): TrackedMessage {
        // Internal message
        if (src.info.type === "internal") {
            const from = src.info.src.toString({ testOnly: true });
            const to = src.info.dest.toString({ testOnly: true });

            return {
                type: "internal",
                from,
                to,
                value: fromNano(src.info.value.coins),
                bounce: src.info.bounce,
                body: this.parseBody(src.body, [src.info.src, src.info.dest]),
            };
        }

        // External in
        if (src.info.type === "external-in") {
            const to = src.info.dest.toString({ testOnly: true });
            return {
                type: "external-in",
                to: to,
                body: this.parseBody(src.body, [src.info.dest]),
            };
        }

        // External out
        return {
            type: "external-out",
            to: src.info.dest ? src.info.dest.toString() : null,
            body: this.parseBody(src.body, [src.info.src]),
        };
    }

    parseTransaction(tx: Transaction) {
        // Some sanity checks
        if (!tx.inMessage) {
            throw Error("Tick-tock transaction is not supported");
        }
        if (tx.description.type !== "generic") {
            throw Error("Non-generic transaction is not supported");
        }

        const events: TrackedEvent[] = [];

        // Check if deployed
        if (
            (tx.oldStatus === "non-existing" ||
                tx.oldStatus === "uninitialized") &&
            tx.endStatus === "active"
        ) {
            events.push({ $type: "deploy" });
        }

        if (tx.description.storagePhase) {
            if (tx.description.storagePhase.storageFeesCollected > 0n) {
                events.push({
                    $type: "storage-charged",
                    amount: fromNano(
                        tx.description.storagePhase.storageFeesCollected,
                    ),
                });
            }
            if (tx.description.storagePhase.statusChange === "frozen") {
                events.push({ $type: "frozen" });
            }
            if (tx.description.storagePhase.statusChange === "deleted") {
                events.push({ $type: "deleted" });
            }
        }

        // Incoming message
        const msg = this.parseMessage(tx.inMessage);
        if (
            tx.inMessage.info.type === "internal" &&
            tx.inMessage.info.bounced
        ) {
            events.push({ $type: "received-bounced", message: msg });
        } else {
            events.push({ $type: "received", message: msg });
        }

        // Processing
        if (tx.description.computePhase.type === "vm") {
            if (tx.description.computePhase.success) {
                events.push({
                    $type: "processed",
                    gasUsed: tx.description.computePhase.gasUsed,
                });
            } else {
                events.push({
                    $type: "failed",
                    errorCode: tx.description.computePhase.exitCode,
                });
            }
        } else {
            events.push({
                $type: "skipped",
                reason: tx.description.computePhase.reason,
            });
        }

        // Outgoing messages
        for (const outgoingMessage of tx.outMessages.values()) {
            const msg = this.parseMessage(outgoingMessage);
            if (
                outgoingMessage.info.type === "internal" &&
                outgoingMessage.info.bounced
            ) {
                events.push({ $type: "sent-bounced", message: msg });
            } else {
                events.push({ $type: "sent", messages: [msg] });
            }
        }

        // Persist events
        this._events.push(events);
    }

    parse(result: SendMessageResult) {
        for (const tx of result.transactions) {
            this.parseTransaction(tx);
        }
    }
}
