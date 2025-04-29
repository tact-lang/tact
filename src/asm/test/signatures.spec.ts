import {signatureOf, signatureString} from "../runtime/stack-signatures"

describe("instructions signatures", () => {
    it("should find correct signatures", () => {
        {
            const signature = signatureOf("ADD")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual("x:Int y:Int -> result:Int")
            }
        }
        {
            const signature = signatureOf("PUSHINT_LONG")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual("∅ -> x:Int")
            }
        }
        {
            const signature = signatureOf("STDICT")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual("D:Cell|Null b:Builder -> b2:Builder")
            }
        }
        {
            const signature = signatureOf("TUPLE")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual("x_1...x_n -> t:Tuple")
            }
        }
        {
            const signature = signatureOf("UNTUPLE")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual("t:Tuple -> x_1...x_n")
            }
        }
        {
            const signature = signatureOf("STDICT")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual("D:Cell|Null b:Builder -> b2:Builder")
            }
        }
        {
            const signature = signatureOf("STUXQ")
            expect(signature).toBeDefined()
            if (signature) {
                expect(signatureString(signature)).toEqual(
                    "x:Int b:Builder l:Int -> (b2:Builder 0)|(x:Int b:Builder -1)|(x:Int b:Builder 1) status:Int",
                )
            }
        }
    })
})
