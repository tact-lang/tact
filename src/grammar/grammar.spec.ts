import { parse } from "./grammar";
import fs from 'fs';
import { ASTRef } from "../ast/ast";

expect.addSnapshotSerializer({
    test: (src) => src instanceof ASTRef,
    print: (src) => `${(src as ASTRef).contents}`
});

describe('grammar', () => {
    let recs = fs.readdirSync(__dirname + "/test/");
    for (let r of recs) {
        it('should parse ' + r, () => {
            let code = fs.readFileSync(__dirname + "/test/" + r, 'utf8');
            expect(parse(code)).toMatchSnapshot();
        });
    }
});