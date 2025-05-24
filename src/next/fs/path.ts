/**
 * Safe relative path
 */
export type RelativePath = {
    /**
     * Number of "../" in front of path
     */
    readonly stepsUp: number;
    /**
     * /-separated strings that go after optional ../
     */
    readonly segments: readonly string[];
};
