import { files as filesBase64 } from "@/stdlib/stdlib";

function base64ToBlob(base64: string): Blob {
    const binary = atob(base64);
    const len = binary.length;
    const bytes = new Uint8Array(len);
    for (let i = 0; i < len; ++i) {
        bytes[i] = binary.charCodeAt(i);
    }
    return new Blob([bytes], { type: "text/plain;charset=utf-8" });
}

export const getFiles = () => {
    const files: Map<string, Blob> = new Map();

    for (const [path, base64] of Object.entries(filesBase64)) {
        files.set(path, base64ToBlob(base64));
    }

    return files;
}
