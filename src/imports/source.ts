export type Language = "func" | "tact";

export type ItemOrigin = "stdlib" | "user";

export type Source = {
    /**
     * @deprecated Paths must be relative
     */
    readonly path: string;
    readonly code: string;
    readonly origin: ItemOrigin;
};
