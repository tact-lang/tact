import { inspect } from "util";

// log json to terminal without shortening
export const logDeep = (obj: unknown, colors = true) => {
    console.log(inspect(obj, {
        colors,
        depth: Infinity,
    }));
};
