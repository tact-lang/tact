import type { PackageFileFormat } from "@/packaging/fileFormat";
import { fileFormat } from "@/packaging/fileFormat";

export function packageCode(pkg: PackageFileFormat) {
    const parsed = fileFormat.parse(pkg);
    return JSON.stringify(parsed);
}
