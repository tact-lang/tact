import { getAllExpressionTypes } from "./resolveExpression";
import { resolveDescriptors } from "./resolveDescriptors";
import { loadCases } from "../utils/loadCases";
import { __DANGER_resetNodeId } from "../grammar/ast";
import { openContext } from "../grammar/store";
import { resolveStatements } from "./resolveStatements";

describe('resolveStatements', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    for (let r of loadCases(__dirname + "/expr/")) {
        it('should resolve expressions for ' + r.name, () => {
            let ctx = openContext([r.code]);
            ctx = resolveDescriptors(ctx);
            ctx = resolveStatements(ctx);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
});