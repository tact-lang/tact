import { Logger } from "../context/logger";
import { funcCompile } from "./funcCompile";
import files from "../stdlib/stdlib";

describe("funcCompile", () => {
    it("should compile small contract", async () => {
        const source = `
            int main(int a, int b) impure {
                return a + b;
            }
        `;
        const res = await funcCompile({
            entries: ["/stdlib.fc", "/small.fc"],
            sources: [
                {
                    path: "/stdlib.fc",
                    content: Buffer.from(
                        files["stdlib.fc"]!,
                        "base64",
                    ).toString(),
                },
                { path: "/small.fc", content: source },
            ],
            logger: new Logger(),
        });
        expect(res.ok).toBe(true);
    });
});
