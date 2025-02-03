export type ItemOrigin = "stdlib" | "user";

export type Source = {
    readonly path: string;
    readonly code: string;
    readonly origin: ItemOrigin;
};

export type Language = "func" | "tact";
