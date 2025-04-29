import {ADD, decompileCell, PUSHINT} from "../../runtime"
import {print} from "../printer"
import {readFileSync} from "node:fs"
import {Cell} from "@ton/core"

describe("assembly-printer", () => {
    it("should print simple assembly", () => {
        const instructions = [PUSHINT(10), PUSHINT(5), ADD()]

        expect(print(instructions)).toMatchSnapshot()
    })

    it("should print assembly", () => {
        const instructions = decompileCell(
            Cell.fromBoc(
                readFileSync(`${__dirname}/testdata/jetton_minter_discoverable_JettonMinter.boc`),
            )[0],
        )

        expect(print(instructions)).toMatchSnapshot()
    })
})
