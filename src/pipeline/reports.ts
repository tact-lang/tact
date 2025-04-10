import { writeReport } from "@/generator/writeReport";
import type { Packages } from "@/pipeline/packaging";
import type { BuildContext } from "@/pipeline/build";

export function doReports(bCtx: BuildContext, packages: Packages): boolean {
    const { project, config, logger } = bCtx;

    logger.info("   > Reports");

    for (const pkg of packages) {
        logger.info("   > " + pkg.name);
        try {
            const report = writeReport(bCtx.ctx, pkg);
            const pathBindings = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".md",
            );
            project.writeFile(pathBindings, report);
        } catch (e) {
            const error = e as Error;
            error.message = `Report generation crashed: ${error.message}`;
            logger.error(error);
            bCtx.errorMessages.push(error);
            return false;
        }
    }

    return true;
}
