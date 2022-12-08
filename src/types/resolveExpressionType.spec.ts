import { getAllExpressionTypes, resolveExpressionTypes } from "./resolveExpressionType";
import { resolveDescriptors } from "./resolveDescriptors";
import { loadCases } from "../utils/loadCases";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { openContext } from "../grammar/store";

describe('resolveExpressionType', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let r of loadCases(__dirname + "/expr/")) {
        it('should resolve expressions for ' + r.name, () => {
            let ctx = openContext([r.code]);
            ctx = resolveDescriptors(ctx);
            ctx = resolveExpressionTypes(ctx);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
});