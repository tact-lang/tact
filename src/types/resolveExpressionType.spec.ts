import { CompilerContext } from "../ast/context";
import { getAllExpressionTypes, resolveExpressionTypes } from "./resolveExpressionType";
import { resolveTypeDescriptors } from "./resolveTypeDescriptors";
import fs from 'fs';

describe('resolveExpressionType', () => {
    let recs = fs.readdirSync(__dirname + "/test-expr/");
    for (let r of recs) {
        it('should resolve expressions for ' + r, () => {
            let code = fs.readFileSync(__dirname + "/test-expr/" + r, 'utf8');
            let ctx = CompilerContext.fromSources([code]);
            ctx = resolveTypeDescriptors(ctx);
            ctx = resolveExpressionTypes(ctx);
            expect(getAllExpressionTypes(ctx)).toMatchSnapshot();
        });
    }
});