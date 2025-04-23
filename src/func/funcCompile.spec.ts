import fs from "fs";
import path from "path";
import { Logger } from "@/context/logger";
import { funcCompile } from "@/func/funcCompile";
import * as Stdlib from "@/stdlib/stdlib";

describe("funcCompile", () => {
    it("should compile small contract", async () => {
        const source = fs.readFileSync(
            path.resolve(__dirname, "__testdata__", "small.fc"),
            "utf8",
        );
        const res = await funcCompile({
            entries: ["/stdlib.fc", "/small.fc"],
            sources: [
                {
                    path: "/stdlib.fc",
                    content: Buffer.from(
                        Stdlib.files["std/stdlib.fc"]!,
                        "base64",
                    ).toString(),
                },
                { path: "/small.fc", content: source },
            ],
            logger: new Logger(),
            debugInfo: false,
        });
        expect(res.ok).toBe(true);
    });
});
