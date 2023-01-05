import { fileFormat, PackageFileFormat } from "./fileFormat";

export function packageCode(pkg: PackageFileFormat) {
    let parsed = fileFormat.parse(pkg);
    return JSON.stringify(parsed);
}