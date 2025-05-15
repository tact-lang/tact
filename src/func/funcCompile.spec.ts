import fs from "fs";
import path from "path";
import { Logger } from "@/context/logger";
import { funcCompile } from "@/func/funcCompile";
import * as Stdlib from "@/stdlib/stdlib";
import { attachment, step } from "@/test/allure/allure";
import { ContentType } from "allure-js-commons";

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
        });
        await attachment("Source", source, ContentType.TEXT);
        await step("Compilation should succeed", () => {
            expect(res.ok).toBe(true);
        });
    });
});
