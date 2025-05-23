import { sha256_sync } from "@ton/crypto";
import path from "path";

/**
 * Ensures the resulting file name does not exceed the given maximum length.
 * If too long, trims the name and appends a short hash to avoid collisions.
 *
 * @param name - The base file name without extension.
 * @param ext - The file extension.
 * @param maxLen - Maximum allowed length for the full file name (default: 255).
 * @returns A safe file name within the specified length.
 */
export const makeSafeName = (
    name: string,
    ext: string,
    maxLen = 255,
): string => {
    const full = name + ext;

    if (full.length <= maxLen) {
        return full;
    }

    const hash = sha256_sync(Buffer.from(name)).toString("hex").slice(0, 8);
    const suffix = `_${hash}${ext}`;
    const maxNameLen = maxLen - suffix.length;
    const safeName = name.slice(0, maxNameLen);

    return `${safeName}${suffix}`;
};

/**
 * Returns the full extension of a file, including all parts after the first dot.
 * - "file.txt" => ".txt"
 * - "archive.tar.gz" => ".tar.gz"
 */
export const getFullExtension = (filename: string): string => {
    const base = path.basename(filename);
    const firstDotIndex = base.indexOf(".");
    return firstDotIndex !== -1 ? base.slice(firstDotIndex) : "";
};
