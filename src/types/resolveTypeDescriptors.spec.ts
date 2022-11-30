import { CompilerContext } from "../ast/context";
import { getAllStaticFunctions, getAllTypes, resolveTypeDescriptors } from "./resolveTypeDescriptors";
import fs from 'fs';
import { ASTRef } from "../ast/ast";

expect.addSnapshotSerializer({
    test: (src) => src instanceof ASTRef,
    print: (src) => `${(src as ASTRef).contents}`
});

describe('resolveTypeDescriptors', () => {
    let recs = fs.readdirSync(__dirname + "/test/");
    for (let r of recs) {
        it('should resolve descriptors for ' + r, () => {
            let code = fs.readFileSync(__dirname + "/test/" + r, 'utf8');
            let ctx = CompilerContext.fromSources([code]);
            ctx = resolveTypeDescriptors(ctx);
            expect(getAllTypes(ctx)).toMatchSnapshot();
            expect(getAllStaticFunctions(ctx)).toMatchSnapshot();
        });
    }
});