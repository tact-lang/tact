import { defineConfig } from "vitest/config";
import tsconfigPaths from "vite-tsconfig-paths";

export default defineConfig({
    plugins: [tsconfigPaths()],
    test: {
        exclude: ["**/node_modules/**", "dist/**"],
        globals: true,
        environment: "node",
        coverage: {
            reporter: ["text", "json", "html"],
            provider: "istanbul",
        },
        setupFiles: ["./vitest.setup.ts"],
        testTimeout: 10_000,
        snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
        logHeapUsage: true,
    },
});
