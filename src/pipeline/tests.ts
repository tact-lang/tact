import { writeTests } from "@/bindings/writeTests";
import type { BuildContext } from "@/pipeline/build";
import type { Packages } from "@/pipeline/packaging";

export function doTests(bCtx: BuildContext, packages: Packages): boolean {
    const { project, config, logger } = bCtx;

    logger.info("   > Tests");

    for (const pkg of packages) {
        logger.info(`   > ${pkg.name}`);

        if (pkg.init.deployment.kind !== "system-cell") {
            const message = `   > ${pkg.name}: unsupported deployment kind ${pkg.init.deployment.kind}`;
            logger.error(message);
            bCtx.errorMessages.push(new Error(message));
            return false;
        }

        try {
            const testsCode = writeTests(
                JSON.parse(pkg.abi),
                bCtx.ctx,
                bCtx.built[pkg.name]?.constants ?? [],
                bCtx.built[pkg.name]?.contract,
                config.name + "_" + pkg.name,
                {
                    code: pkg.code,
                    prefix: pkg.init.prefix,
                    system: pkg.init.deployment.system,
                    args: pkg.init.args,
                },
            );
            const testsPath = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".stub.tests.ts",
            );
            project.writeFile(testsPath, testsCode);
        } catch (e) {
            const error = e as Error;
            error.message = `Tests generator crashed: ${error.message}`;
            logger.error(error);
            bCtx.errorMessages.push(error);
            return false;
        }
    }

    return true;
}
