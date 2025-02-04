import { Interval } from "ohm-js";
import { getSrcInfo, SrcInfo } from "../src-info";
import { ItemOrigin } from "../../imports/source";

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
