import { beginCell, Cell, Dictionary } from "@ton/core";
import { packageCode } from "@/packaging/packageCode";
import { getCompilerVersion } from "@/pipeline/version";
import type { PackageFileFormat } from "@/packaging/fileFormat";
import {
    createABITypeRefFromTypeRef,
    resolveABIType,
} from "@/types/resolveABITypeRef";
import { idText } from "@/ast/ast-helpers";
import { getContracts, getType } from "@/types/resolveDescriptors";
import { posixNormalize } from "@/utils/filePath";
import { getRawAST } from "@/context/store";
import type { BuildContext } from "@/pipeline/build";

export type Packages = readonly PackageFileFormat[];

// Represent dictionary with child contracts code or empty if no child contracts
type ChildContractsDict = NonEmptyChildContractsDict | NoChildContracts;

type NonEmptyChildContractsDict = {
    readonly $: "NonEmptyChildContractsDict";
    readonly cell: Cell;
};

const NonEmptyChildContractsDict = (
    cell: Cell,
): NonEmptyChildContractsDict => ({
    $: "NonEmptyChildContractsDict",
    cell,
});

type NoChildContracts = {
    readonly $: "NoChildContracts";
};

const NoChildContracts: NoChildContracts = { $: "NoChildContracts" };

export function doPackaging(bCtx: BuildContext): Packages | undefined {
    bCtx.logger.info("   > Packaging");

    const packages: PackageFileFormat[] = [];

    const contracts = getContracts(bCtx.ctx);
    for (const contract of contracts) {
        const pkg = packageContract(bCtx, contract.name);
        if (!pkg) continue;
        packages.push(pkg);
    }

    return packages;
}

function buildChildContractsDict(
    bCtx: BuildContext,
    contract: string,
): ChildContractsDict | undefined {
    const depends = Dictionary.empty(
        Dictionary.Keys.Uint(16),
        Dictionary.Values.Cell(),
    );

    const contractType = getType(bCtx.ctx, contract);

    for (const dependencyContract of contractType.dependsOn) {
        const dependencyContractBuild = bCtx.built[dependencyContract.name];
        if (!dependencyContractBuild) {
            const message = `   > ${dependencyContract.name}: no artifacts found`;
            bCtx.logger.error(message);
            bCtx.errorMessages.push(new Error(message));
            return undefined;
        }

        const dependencyContractCell = Cell.fromBoc(
            dependencyContractBuild.codeBoc,
        )[0]!;
        depends.set(dependencyContract.uid, dependencyContractCell);
    }

    if (contractType.dependsOn.length === 0) {
        return NoChildContracts;
    }

    return NonEmptyChildContractsDict(beginCell().storeDict(depends).endCell());
}

function packageContract(
    bCtx: BuildContext,
    contract: string,
): PackageFileFormat | undefined {
    const { project, config, logger, errorMessages, stdlib } = bCtx;

    logger.info("   > " + contract);
    const artifacts = bCtx.built[contract];
    if (!artifacts) {
        const message = `   > ${contract}: no artifacts found`;
        logger.error(message);
        errorMessages.push(new Error(message));
        return undefined;
    }

    const childContractsDict = buildChildContractsDict(bCtx, contract);
    if (childContractsDict === undefined) {
        return undefined;
    }

    // Collect sources
    const sources: Record<string, string> = {};
    const rawAst = getRawAST(bCtx.ctx);
    for (const source of [...rawAst.funcSources, ...rawAst.sources]) {
        if (
            source.path.startsWith(project.root) &&
            !source.path.startsWith(stdlib.root)
        ) {
            const source_path = posixNormalize(
                source.path.slice(project.root.length),
            );
            sources[source_path] = Buffer.from(source.code).toString("base64");
        }
    }

    const descriptor = getType(bCtx.ctx, contract);
    const init = descriptor.init!;

    const args =
        init.kind !== "contract-params"
            ? init.params.map((v) => ({
                  // FIXME: wildcards in ABI?
                  name: v.name.kind === "id" ? v.name.text : "_",
                  type: createABITypeRefFromTypeRef(
                      bCtx.ctx,
                      v.type,
                      v.loc,
                      v.as,
                  ),
              }))
            : (init.contract.params ?? []).map((v) => ({
                  name: idText(v.name),
                  type: resolveABIType(v),
              }));

    // Package
    const pkg: PackageFileFormat = {
        name: contract,
        abi: artifacts.abi,
        code: artifacts.codeBoc.toString("base64"),
        init: {
            kind: "direct",
            args,
            prefix:
                init.kind !== "contract-params"
                    ? {
                          bits: 1,
                          value: 0,
                      }
                    : undefined,
            deployment: {
                kind: "system-cell",
                system:
                    childContractsDict.$ === "NonEmptyChildContractsDict"
                        ? childContractsDict.cell.toBoc().toString("base64")
                        : null,
            },
        },
        sources,
        compiler: {
            name: "tact",
            version: getCompilerVersion(),
            parameters: bCtx.compilerInfo,
        },
    };

    const pkgData = packageCode(pkg);
    const pathPkg = project.resolve(
        config.output,
        config.name + "_" + contract + ".pkg",
    );
    project.writeFile(pathPkg, pkgData);

    return pkg;
}
