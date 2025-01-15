import fs from "fs";
import path from "path";
import { Logger } from "../context/logger";
import { funcCompile } from "./funcCompile";
import files from "../imports/stdlib";

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
