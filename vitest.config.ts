/// <reference types="vitest" />
import { defineConfig } from "vitest/config";
import { resolve } from "path";

export default defineConfig({
    resolve: {
        alias: {
            "@": resolve(__dirname, "src"),
        },
    },
    test: {
        exclude: ["**/node_modules/**", "**/dist/**"],
        globals: true,
        environment: "node",
        coverage: {
            reporter: ["text", "json", "html"],
            provider: "istanbul",
        },
        setupFiles: ["./vitest.chdir.ts", "./vitest.setup.ts"],
        testTimeout: 10_000,
        snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
        logHeapUsage: true,
        pool: "forks",
    },
});
