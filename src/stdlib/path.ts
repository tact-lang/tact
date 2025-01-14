import path from "path";
import { posixNormalize } from "../utils/filePath";

export const stdlibPath = posixNormalize(path.join(__dirname, "stdlib"));
