import { getAllTypes, resolveDescriptors } from "@/types/resolveDescriptors";
import { loadCases } from "@/utils/loadCases";
import { openContext, parseModules } from "@/context/store";
import { resolveStatements } from "@/types/resolveStatements";
import { CompilerContext } from "@/context/context";
import { featureEnable } from "@/config/features";
import { getParser } from "@/grammar";
import { getAstFactory } from "@/ast/ast-helpers";
import { computeReceiversEffects } from "@/types/effects";
import type { Source } from "@/imports/source";
import * as allure from "allure-js-commons";

describe("effects", () => {
    allure.tags("Effects");
    for (const testContract of loadCases(__dirname + "/effects/")) {
        it(`should correctly compute effects: ${testContract.name}`, () => {
            const Ast = getAstFactory();
            const sources: Source[] = [
                {
                    code: testContract.code,
                    path: "<unknown>",
                    origin: "user",
                },
            ];
            let ctx = openContext(
                new CompilerContext(),
                sources,
                [],
                parseModules(sources, getParser(Ast)),
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
