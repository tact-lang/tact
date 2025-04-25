import * as os from "os";
import { existsSync, mkdirSync } from "fs";
import {
    NonTerminal,
    Terminal,
} from "@/test/fuzzer/src/generators/uniform-expr-gen";
import type {
    NonTerminalEnum,
    TerminalEnum,
} from "@/test/fuzzer/src/generators/uniform-expr-gen";

/**
 * The default number of executions per test. Corresponds to fast-check defaults.
 */
const DEFAULT_NUM_RUNS: number = 100;

/**
 * Configuration handler for fuzz testing settings.
 */
export class FuzzConfig {
    /**
     * The number of samples to dump during fuzz testing.
     * If `samplesNum` is not set, the fuzzer won't dump samples.
     */
    public samplesNum: number | undefined;

    /**
     * A format used to dump samples.
     */
    public samplesFormat: "ast" | "json" = "ast";

    /**
     * Explicitly specified fast-check seed.
     */
    public seed: number | undefined;

    /**
     * Number of AST generation cycles. POSITIVE_INFINITY means running in the continuous fuzzing mode.
     */
    public numRuns: number;

    /**
     * Directory to save contracts compiled during the compilation test.
     */
    public compileDir: string;

    /**
     * Maximum AST generation depth.
     */
    public maxDepth: number = 5;

    /**
     * Default generation parameters. Used by entity constructors.
     */

    /**
     * -------------------------------------
     * Parameters for contract generation
     * -------------------------------------
     */

    /**
     * Minimum number of receivers generated within a contract.
     * @default 1
     */
    public static receiveMinNum: number = 1;

    /**
     * Maximum number of receivers generated within a contract.
     * @default 5
     */
    public static receiveMaxNum: number = 5;

    /**
     * Minimum number of constants generated within a contract.
     * @default 1
     */
    public static contractConstantMinNum: number = 1;

    /**
     * Maximum number of constants generated within a contract.
     * @default 5
     */
    public static contractConstantMaxNum: number = 5;

    /**
     * Minimum number of fields generated within a contract.
     * @default 1
     */
    public static contractFieldMinNum: number = 1;

    /**
     * Maximum number of fields generated within a contract.
     * @default 5
     */
    public static contractFieldMaxNum: number = 5;

    /**
     * -------------------------------------
     * Parameters for trait generation
     * -------------------------------------
     * TODO: make this parameters into min and max
     */

    /**
     * Number of fields generated within a trait.
     * @default 1
     */
    public static traitFieldNum: number = 1;

    /**
     * Number of method declarations generated within a trait.
     * @default 1
     */
    public static traitMethodDeclarationsNum: number = 1;

    /**
     * Number of constant declarations generated within a trait.
     * @default 1
     */
    public static traitConstantNum: number = 1;

    /**
     * -------------------------------------
     * Parameters for expression generation
     * -------------------------------------
     */

    /**
     * Indicates whether generated expressions could use identifiers declared in the scope.
     * @default true
     */
    public static useIdentifiersInExpressions: boolean = true;

    /**
     * The minimum expression size.
     * @default 1
     */
    public static minExpressionSize: number = 1;

    /**
     * The maximum expression size.
     * @default 5
     */
    public static maxExpressionSize: number = 5;

    /**
     * Non-terminals that the expression generator is allowed to use.
     * @default Object.values(NonTerminal)
     */
    public static allowedNonTerminalsInExpressions: NonTerminalEnum[] =
        Object.values(NonTerminal);

    /**
     * Terminals that the the expression generator is allowed to use.
     * @default Object.values(Terminal);
     */
    public static allowedTerminalsInExpressions: TerminalEnum[] =
        Object.values(Terminal);

    /**
     * -------------------------------------
     * Parameters for function generation
     * -------------------------------------
     */

    /**
     * Minimum number of let statements at the start of function body.
     * @default 1
     */
    public static letStatementsMinNum: number = 1;

    /**
     * Maximum number of let statements at the start of function body.
     * @default 5
     */
    public static letStatementsMaxNum: number = 5;

    /**
     * Minimum number of sequential statements in the function body (not counting initial let statements and final return)
     * @default 1
     */
    public static statementsMinLength: number = 1;

    /**
     * Maximum number of sequential statements in the function body (not counting initial let statements and final return)
     * @default 5
     */
    public static statementsMaxLength: number = 5;

    /**
     * -------------------------------------
     * Parameters for module generation
     * -------------------------------------
     */

    /**
     * Add definitions that mock stdlib ones to the generated program.
     * @default false
     */
    public static addStdlib: boolean = false;

    /**
     * Minimum number of structures.
     * @default 1
     */
    public static structsMinNum: number = 1;

    /**
     * Maximum number of structures.
     * @default 4
     */
    public static structsMaxNum: number = 4;

    /**
     * Minimum number of messages.
     * @default 1
     */
    public static messagesMinNum: number = 1;

    /**
     * Maximum number of messages.
     * @default 4
     */
    public static messagesMaxNum: number = 4;

    /**
     * Minimum number of the generated traits. Some of them might be used by the generated contracts.
     * @default 1
     */
    public static traitsMinNum: number = 1;

    /**
     * Maximum number of the generated traits. Some of them might be used by the generated contracts.
     * @default 4
     */
    public static traitsMaxNum: number = 4;

    /**
     * Minimum number of generated contracts
     * @default 1
     */
    public static contractsMinNum: number = 1;

    /**
     * Maximum number of generated contracts
     * @default 4
     */
    public static contractsMaxNum: number = 4;

    /**
     * Minimum number of generated global functions
     * @default 1
     */
    public static functionsMinNum: number = 1;

    /**
     * Maximum number of generated global functions
     * @default 4
     */
    public static functionsMaxNum: number = 4;

    /**
     * Minimum number of global function arguments
     * @default 0
     */
    public static functionArgsMinNum: number = 0;

    /**
     * Maximum number of global function arguments
     * @default 6
     */
    public static functionArgsMaxNum: number = 6;

    /**
     * Minimum number of generated global constants
     * @default 1
     */
    public static constantsMinNum: number = 1;

    /**
     * Maximum number of generated global constants
     * @default 4
     */
    public static constantsMaxNum: number = 4;

    /**
     * -------------------------------------
     * Parameters for general statement generation
     * -------------------------------------
     * TODO: Make these arguments into min and max parameters
     */

    /**
     * Determines the maximum depth of nested statement blocks.
     * @default 2
     */
    public static nestedBlocksNum: number = 2;

    /**
     * Number of statements in each block.
     * @default 3
     */
    public static stmtsInBlock: number = 3;

    constructor() {
        this.samplesNum = process.env.SAMPLES_NUM
            ? parseInt(process.env.SAMPLES_NUM)
            : undefined;
        if (process.env.SAMPLES_FORMAT) {
            this.validateAndSetFormat(process.env.SAMPLES_FORMAT);
        }
        this.compileDir = process.env.COMPILE_DIR ?? os.tmpdir();
        if (process.env.COMPILE_DIR && !existsSync(process.env.COMPILE_DIR)) {
            mkdirSync(process.env.COMPILE_DIR, { recursive: true });
        }
        this.seed = process.env.SEED ? parseInt(process.env.SEED) : undefined;
        this.numRuns =
            process.env.FUZZ === "1"
                ? Number.POSITIVE_INFINITY
                : process.env.NUM_RUNS
                  ? parseInt(process.env.NUM_RUNS)
                  : DEFAULT_NUM_RUNS;
        if (this.samplesNum && this.numRuns < this.samplesNum) {
            console.warn(
                `the requested number of SAMPLES_NUM=${this.samplesNum} is less than NUM_RUNS=${this.numRuns}`,
            );
        }
    }

    /**
     * Validates and sets the sample format based on the provided format string.
     * Throws an error if the format is not supported.
     * @param fmt The format string to validate and set.
     */
    private validateAndSetFormat(fmt: string): void {
        const supportedFormats: ("ast" | "json")[] = ["ast", "json"];
        if (supportedFormats.includes(fmt as "ast" | "json")) {
            this.samplesFormat = fmt as "ast" | "json";
        } else {
            throw new Error(
                `unsupported SAMPLES_FMT: ${fmt} (supported options: "ast" and "json")`,
            );
        }
    }
}
