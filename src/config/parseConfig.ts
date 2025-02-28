import type { Config } from "./config";
import { configSchema } from "./config.zod";

export * from "./config";
export * from "./config.zod";

/**
 * Takes a stringified JSON [src] of a schema, converts to JSON and returns a parsed schema if it's valid
 *
 * @throws If the provided JSON string isn't a valid JSON
 * @throws If the provided JSON string isn't valid according to the config schema
 */
export function parseConfig(src: string) {
    const parsed = JSON.parse(src);
    return configSchema.parse(parsed);
}

/**
 * Takes a config schema object and verifies that it's valid
 *
 * @throws If the provided object isn't valid according to the config schema
 */
export function verifyConfig(config: Config) {
    return configSchema.parse(config);
}
