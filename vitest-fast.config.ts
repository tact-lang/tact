import mainConfig from "./vitest.config";
import { defineConfig } from "vitest/config";

export default defineConfig({
    ...mainConfig,
    test: {
        ...(mainConfig.test ?? {}),
        exclude: [
            "**/node_modules/**",
            "dist/**",
            "src/test/e2e-slow/**",
            "src/cli/e2e.spec.ts",
            "src/ast/fuzz.spec.ts",
        ],
    },
});
