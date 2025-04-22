import type { Blockchain, BlockchainSnapshot } from "@ton/sandbox";

/**
 * Creates a resettable test environment
 * @param setupFn Function to set up test environment
 */
export const cached = <T extends { blockchain: Blockchain }>(
    setupFn: () => Promise<T>,
) => {
    let state: T;
    let snapshot: BlockchainSnapshot;

    beforeAll(async () => {
        state = await setupFn();
        snapshot = state.blockchain.snapshot();
    });

    return {
        async get() {
            await state.blockchain.loadFrom(snapshot);
            return state;
        },
    };
};
