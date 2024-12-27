import { Interval } from "ohm-js";
import { getSrcInfo, ItemOrigin, SrcInfo } from "../src-info";

/**
 * @deprecated
 */
export const getSrcInfoFromOhm = (
    { sourceString, startIdx, endIdx }: Interval,
    file: string | null,
    origin: ItemOrigin,
): SrcInfo => {
    return getSrcInfo(sourceString, startIdx, endIdx, file, origin);
};