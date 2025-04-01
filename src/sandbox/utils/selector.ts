import { crc16 } from "@/sandbox/utils/crc16";

export function getSelectorForMethod(methodName: string) {
    if (methodName === "main") {
        return 0;
    } else if (methodName === "recv_internal") {
        return 0;
    } else if (methodName === "recv_external") {
        return -1;
    } else {
        return (crc16(methodName) & 0xffff) | 0x10000;
    }
}
