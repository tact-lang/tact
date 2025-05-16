import { signatureOf, signatureString } from "@/asm/runtime/stack-signatures";
import { step } from "@/test/allure/allure";

describe("instructions signatures", () => {
    it("should find correct signatures", async () => {
        {
            const signature = await signatureOf("ADD");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                expect(signatureString(signature)).toEqual(
                    "x:Int y:Int -> result:Int",
                );
            }
        }
        {
            const signature = await signatureOf("PUSHINT_LONG");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                await step("Signature should match expected", () => {
                    expect(signatureString(signature)).toEqual("∅ -> x:Int");
                });
            }
        }
        {
            const signature = await signatureOf("STDICT");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                await step("Signature should match expected", () => {
                    expect(signatureString(signature)).toEqual(
                        "D:Cell|Null b:Builder -> b2:Builder",
                    );
                });
            }
        }
        {
            const signature = await signatureOf("TUPLE");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                await step("Signature should match expected", () => {
                    expect(signatureString(signature)).toEqual(
                        "x_1...x_n -> t:Tuple",
                    );
                });
            }
        }
        {
            const signature = await signatureOf("UNTUPLE");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                await step("Signature should match expected", () => {
                    expect(signatureString(signature)).toEqual(
                        "t:Tuple -> x_1...x_n",
                    );
                });
            }
        }
        {
            const signature = await signatureOf("STDICT");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                await step("Signature should match expected", () => {
                    expect(signatureString(signature)).toEqual(
                        "D:Cell|Null b:Builder -> b2:Builder",
                    );
                });
            }
        }
        {
            const signature = await signatureOf("STUXQ");
            await step("Signature should be defined", () => {
                expect(signature).toBeDefined();
            });
            if (signature) {
                await step("Signature should match expected", () => {
                    expect(signatureString(signature)).toEqual(
                        "x:Int b:Builder l:Int -> (b2:Builder 0)|(x:Int b:Builder -1)|(x:Int b:Builder 1) status:Int",
                    );
                });
            }
        }
    });
});
