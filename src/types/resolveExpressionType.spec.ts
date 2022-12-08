import { CompilerContext } from "../ast/context";
import { getAllExpressionTypes, resolveExpressionTypes } from "./resolveExpressionType";
import { resolveTypeDescriptors } from "./resolveTypeDescriptors";
import { loadCases } from "../utils/loadCases";
import { __DANGER_resetNodeId } from "../ast/ast";

describe('resolveExpressionType', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let r of loadCases(__dirname + "/expr/")) {
        it('should resolve expressions for ' + r.name, () => {
            let ctx = CompilerContext.fromSources([r.code]);
            ctx = resolveTypeDescriptors(ctx);
            ctx = resolveExpressionTypes(ctx);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
});