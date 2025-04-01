import type { AccountStatus, Address, Cell, Transaction } from "@/core";

export type EventAccountCreated = {
    type: "account_created";
    account: Address;
};

export type EventAccountDestroyed = {
    type: "account_destroyed";
    account: Address;
};

export type EventMessageSent = {
    type: "message_sent";
    from: Address;
    to: Address;
    value: bigint;
    body: Cell;
    bounced: boolean;
};

export type Event =
    | EventAccountCreated
    | EventAccountDestroyed
    | EventMessageSent;

type EventExtractor = (tx: Transaction) => Event[];

const extractors: EventExtractor[] = [
    extractAccountCreated,
    extractMessageSent,
    extractAccountDestroyed,
];

export function extractEvents(tx: Transaction): Event[] {
    return extractors.map((f) => f(tx)).flat();
}

function doesAccountExist(state: AccountStatus): boolean {
    return !(state === "uninitialized" || state === "non-existing");
}

function extractAccountCreated(tx: Transaction): Event[] {
    if (!doesAccountExist(tx.oldStatus) && doesAccountExist(tx.endStatus))
        return [
            {
                type: "account_created",
                account: tx.inMessage!.info.dest! as Address,
            },
        ];

    return [];
}

function extractAccountDestroyed(tx: Transaction): Event[] {
    if (doesAccountExist(tx.oldStatus) && !doesAccountExist(tx.endStatus))
        return [
            {
                type: "account_destroyed",
                account: tx.inMessage!.info.dest! as Address,
            },
        ];

    return [];
}

function extractMessageSent(tx: Transaction): Event[] {
    return tx.outMessages.values().flatMap((m) => {
        if (m.info.type !== "internal") {
            return [];
        }

        return [
            {
                type: "message_sent",
                from: m.info.src,
                to: m.info.dest,
                value: m.info.value.coins,
                body: m.body,
                bounced: m.info.bounced,
            },
        ];
    });
}
