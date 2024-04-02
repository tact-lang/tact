import { fileFormat, PackageFileFormat } from "./fileFormat";

export function packageCode(pkg: PackageFileFormat) {
    const parsed = fileFormat.parse(pkg);
    return JSON.stringify(parsed);
}
