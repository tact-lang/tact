import type { Interval } from "ohm-js";
import type { SrcInfo } from "../src-info";
import { getSrcInfo } from "../src-info";
import type { ItemOrigin } from "../../imports/source";

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
