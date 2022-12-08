import { CompilerContext } from "../ast/context";
import { getAllStaticFunctions, getAllTypes, resolveTypeDescriptors } from "./resolveTypeDescriptors";
import fs from 'fs';
import { ASTRef, __DANGER_resetNodeId } from "../ast/ast";
import { loadCases } from "../utils/loadCases";

expect.addSnapshotSerializer({
    test: (src) => src instanceof ASTRef,
    print: (src) => `${(src as ASTRef).contents}`
});

describe('resolveTypeDescriptors', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let r of loadCases(__dirname + "/test/")) {
        it('should resolve descriptors for ' + r.name, () => {
            let ctx = CompilerContext.fromSources([r.code]);
            ctx = resolveTypeDescriptors(ctx);
            expect(getAllTypes(ctx)).toMatchSnapshot();
            expect(getAllStaticFunctions(ctx)).toMatchSnapshot();
        });
    }
    for (let r of loadCases(__dirname + "/test-failed/")) {
        it('should fail descriptors for ' + r.name, () => {
            let ctx = CompilerContext.fromSources([r.code]);
            expect(() => resolveTypeDescriptors(ctx)).toThrowErrorMatchingSnapshot();
        });
    }
});