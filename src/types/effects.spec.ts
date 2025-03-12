import { getAllTypes, resolveDescriptors } from "./resolveDescriptors";
import { loadCases } from "../utils/loadCases";
import { openContext } from "../context/store";
import { resolveStatements } from "./resolveStatements";
import { CompilerContext } from "../context/context";
import { featureEnable } from "../config/features";
import { getParser } from "../grammar";
import { getAstFactory } from "../ast/ast-helpers";
import { computeReceiversEffects } from "./effects";

describe("effects", () => {
    for (const testContract of loadCases(__dirname + "/effects/")) {
        it(`should correctly compute effects: ${testContract.name}`, () => {
            const Ast = getAstFactory();
            let ctx = openContext(
                new CompilerContext(),
                [
                    {
                        code: testContract.code,
                        path: "<unknown>",
                        origin: "user",
                    },
                ],
                [],
                getParser(Ast),
            );
            ctx = featureEnable(ctx, "external");
            ctx = resolveDescriptors(ctx, Ast);
            ctx = resolveStatements(ctx);
            computeReceiversEffects(ctx);
            const receiverEffects = getAllTypes(ctx)
                .filter((type) => type.kind === "contract")
                .map((contract) => {
                    return {
                        contract: contract.name,
                        receivers: contract.receivers.map((receiver) => {
                            return {
                                ...receiver.selector,
                                effects: receiver.effects,
                            };
                        }),
                    };
                });
            expect(receiverEffects).toMatchSnapshot();
        });
    }
});
