import type { BuildContext } from "@/pipeline/build";
import type { Packages } from "@/pipeline/packaging";
import { writeTypescript } from "@/bindings/writeTypescript";

export function doBindings(bCtx: BuildContext, packages: Packages) {
    const { project, config, logger } = bCtx;

    logger.info("   > Bindings");

    for (const pkg of packages) {
        logger.info(`   > ${pkg.name}`);

        if (pkg.init.deployment.kind !== "system-cell") {
            const message = `   > ${pkg.name}: unsupported deployment kind ${pkg.init.deployment.kind}`;
            logger.error(message);
            bCtx.errorMessages.push(new Error(message));
            return false;
        }

        try {
            const bindingsServer = writeTypescript(
                JSON.parse(pkg.abi),
                bCtx.ctx,
                bCtx.built[pkg.name]?.constants ?? [],
                bCtx.built[pkg.name]?.contract,
                {
                    code: pkg.code,
                    prefix: pkg.init.prefix,
                    system: pkg.init.deployment.system,
                    args: pkg.init.args,
                },
            );
            const bindingPath = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".ts",
            );
            project.writeFile(bindingPath, bindingsServer);
        } catch (e) {
            const error = e as Error;
            error.message = `Bindings compiler crashed: ${error.message}`;
            logger.error(error);
            bCtx.errorMessages.push(error);
            return false;
        }
    }

    return true;
}
