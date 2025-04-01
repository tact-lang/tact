import { AsyncLock } from "@/sandbox/utils/AsyncLock";

describe("AsyncLock", () => {
    it("should work", async () => {
        const sleep = (ms: number): Promise<void> =>
            new Promise((resolve) => {
                setTimeout(resolve, ms);
            });

        const lock = new AsyncLock();

        const events: { id: number; when: "pre" | "post" }[] = [];

        const deferredAction = async (id: number) => {
            await lock.with(async () => {
                events.push({ id, when: "pre" });
                await sleep(10);
                events.push({ id, when: "post" });
            });
        };

        const ids = [1, 2, 3];

        for (const id of ids) {
            void deferredAction(id);
        }

        await sleep(100);

        expect(events).toEqual(
            ids.flatMap((id) => [
                { id, when: "pre" },
                { id, when: "post" },
            ]),
        );
    });
});
