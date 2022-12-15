import { CompilerContext } from "../context";
import { getAllStaticFunctions, getAllTypes, resolveDescriptors } from "./resolveDescriptors";
import { ASTRef, __DANGER_resetNodeId } from "../grammar/ast";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../grammar/store";

expect.addSnapshotSerializer({
    test: (src) => src instanceof ASTRef,
    print: (src) => `${(src as ASTRef).contents}`
});

describe('resolveDescriptors', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let r of loadCases(__dirname + "/test/")) {
        it('should resolve descriptors for ' + r.name, () => {
            let ctx = openContext(new CompilerContext(), [r.code]);
            ctx = resolveDescriptors(ctx);
            expect(getAllTypes(ctx)).toMatchSnapshot();
            expect(getAllStaticFunctions(ctx)).toMatchSnapshot();
        });
    }
    for (let r of loadCases(__dirname + "/test-failed/")) {
        it('should fail descriptors for ' + r.name, () => {
            let ctx = openContext(new CompilerContext(), [r.code]);
            expect(() => resolveDescriptors(ctx)).toThrowErrorMatchingSnapshot();
        });
    }
});