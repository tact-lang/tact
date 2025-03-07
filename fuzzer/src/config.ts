import * as os from "os";
import { existsSync, mkdirSync } from "fs";

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

  constructor() {
    this.samplesNum = process.env.SAMPLES_NUM
      ? parseInt(process.env.SAMPLES_NUM)
      : undefined;
    if (process.env.SAMPLES_FORMAT) {
      this.validateAndSetFormat(process.env.SAMPLES_FORMAT);
    }
    this.compileDir = process.env.COMPILE_DIR
      ? process.env.COMPILE_DIR
      : os.tmpdir();
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
