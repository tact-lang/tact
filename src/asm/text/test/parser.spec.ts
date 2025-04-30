import {decompileCell} from "../../runtime"
import {print} from "../printer"
import {readFileSync} from "node:fs"
import {parse} from "../parse"
import {boc} from "../../runtime/util"

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

    it("should parse assembly with raw pushref", () => {
        const code = `
            PUSHREF x{71}
        `
        const res = parse("test.asm", code)
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error")
        }

        expect(print(res.instructions)).toMatchSnapshot()
    })

    it("should parse assembly with invalid raw pushref", () => {
        const code = `
            PUSHREF x{22221}
        `
        const res = parse("test.asm", code)
        if (res.$ === "ParseFailure") {
            throw new Error("unexpected parser error")
        }

        expect(print(res.instructions)).toMatchSnapshot()
    })

    it("should parse and print assembly", () => {
        const instructions = decompileCell(
            boc(
                readFileSync(
                    `${__dirname}/testdata/jetton_minter_discoverable_JettonMinter.boc`,
                ).toString("hex"),
            ).asCell(),
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
