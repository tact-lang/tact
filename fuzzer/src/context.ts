import JSONbig from "json-bigint";

import { formatAst } from "./formatter";
import { FuzzConfig } from "./config";
import { AstNode } from "../../src/ast/ast";

/**
 * FuzzContext represents a stateful context that handles AST generation.
 * It keeps the global options used to control and configure the AST generation.
 */
export class FuzzContext {
  /**
   * Tracks the number of samples that have been printed.
   */
  private printedSamplesCount: number = 0;

  /**
   * Configuration of the fuzzer.
   */
  public config: FuzzConfig;

  /**
   * Current depth of AST expression generation, which limits recursive generation.
   */
  private currentDepth: number = 0;

  constructor() {
    this.config = new FuzzConfig();
  }

  public getDepth(): number {
    return this.currentDepth;
  }

  public incDepth(): void {
    this.currentDepth++;
  }

  public decDepth(): void {
    this.currentDepth--;
    if (this.currentDepth < 0) {
      throw new Error("Reached negative recursion depth");
    }
  }

  public resetDepth(): void {
    this.currentDepth = 0;
  }

  /**
   * Formats the given AST construction according to the current formatter configuration.
   */
  public format(value: AstNode, fmt = this.config.samplesFormat): string {
    switch (fmt) {
      case "json":
        return `${JSONbig.stringify(value, null, 2)}`;
      case "ast":
        return `${formatAst(value)}`;
      default:
        throw new Error(
          `Unsupported sample format: ${this.config.samplesFormat}`,
        );
    }
  }

  /**
   * Prints the given sample if the number of already printed samples is less than the configured limit.
   * @param sample The sample to print.
   */
  public printSample(sample: AstNode): void {
    if (
      this.config.samplesNum === undefined ||
      this.printedSamplesCount >= this.config.samplesNum
    ) {
      return;
    }
    console.log(`Sample #${this.printedSamplesCount}:\n${this.format(sample)}`);
    this.printedSamplesCount++;
  }
}

/**
 * A global context accessible and mutable throughout the generation process to
 * reflect changes across the AST.
 */
// eslint-disable-next-line prefer-const
export let GlobalContext: FuzzContext = new FuzzContext();
