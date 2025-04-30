import {parse} from "../parse"

describe("logs-parse", () => {
    it("should parse NaN", () => {
        const res = parse(`
            stack: [ 0 ] 
            code cell hash: C4252597808DE321E4DBEDFCF683B8D9A53BB1E5A77FDD44091B1163114468FA offset: 0
            execute PUSHINT 200
            gas remaining: 9999977
            stack: [ 0 200 ] 
            code cell hash: C4252597808DE321E4DBEDFCF683B8D9A53BB1E5A77FDD44091B1163114468FA offset: 32
            execute FITS 1
            gas remaining: 9999943
            stack: [ 0 NaN ] 
            execute implicit RET
            gas remaining: 9999938
        `)

        expect(res).toMatchSnapshot()
    })
})
