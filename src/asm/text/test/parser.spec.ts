import {decompileCell} from "../../runtime"
import {print} from "../printer"
import {readFileSync} from "node:fs"
import {Cell} from "@ton/core"
import {parse} from "../parse"

describe("assembly-parser", () => {
    it("should parse simple assembly", () => {
        const code = `
            PUSHINT 10
            PUSHINT 5
            ADD
        `
        const res = parse("test.asm", code)
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error")
        }

        expect(print(res.instructions)).toMatchSnapshot()
    })

    it("should parse and print assembly", () => {
        const instructions = decompileCell(
            Cell.fromBoc(
                readFileSync(`${__dirname}/testdata/jetton_minter_discoverable_JettonMinter.boc`),
            )[0],
        )
        const assembly = print(instructions)

        const res = parse("test.asm", assembly)
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error")
        }

        const assembly2 = print(res.instructions)

        expect(assembly2).toEqual(assembly)
    })

    it("should not parse assembly with error", () => {
        const code = `
            PUSHINT 10 ,
            PUSHINT 5
            ADD
        `
        const res = parse("test.asm", code)
        if (res.$ === "ParseSuccess") {
            throw new Error("unexpected parser success")
        }

        expect(res.error.toString()).toMatchSnapshot()
    })

    it("should give an error for malformed assembly", () => {
        const code = `
            PUSHINT // no arg
            PUSHINT 5
            ADD
        `
        const res = parse("test.asm", code)
        if (res.$ === "ParseSuccess") {
            throw new Error("unexpected parser success")
        }

        expect(res.error.toString()).toMatchSnapshot()
    })
})
