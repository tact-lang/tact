import { CompilerContext } from "../context";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveDescriptors,
} from "./resolveDescriptors";
import { resolveSignatures } from "./resolveSignatures";
import { ASTRef, __DANGER_resetNodeId } from "../grammar/ast";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../grammar/store";
import { featureEnable } from "../config/features";

expect.addSnapshotSerializer({
    test: (src) => src instanceof ASTRef,
    print: (src) => `${(src as ASTRef).contents}`,
});

describe("resolveDescriptors", () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (const r of loadCases(__dirname + "/test/")) {
        it("should resolve descriptors for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx);
            ctx = resolveSignatures(ctx);
            expect(getAllTypes(ctx)).toMatchSnapshot();
            expect(getAllStaticFunctions(ctx)).toMatchSnapshot();
        });
    }
    for (const r of loadCases(__dirname + "/test-failed/")) {
        it("should fail descriptors for " + r.name, () => {
            let ctx = openContext(
                new CompilerContext(),
                [{ code: r.code, path: "<unknown>", origin: "user" }],
                [],
            );
            ctx = featureEnable(ctx, "external");
            expect(() =>
                resolveDescriptors(ctx),
            ).toThrowErrorMatchingSnapshot();
        });
    }
});
