import { ASTRef } from "../ast/ast";
import { CompilerContext } from "../ast/context";
import { topologicalSort } from "../utils";

export class Writer {
    private indent = 0;
    private lines: string[] = [];

    inIndent = (handler: () => void) => {
        this.indent++;
        handler();
        this.indent--;
    };

    append(src: string = '') {
        this.lines.push(' '.repeat(this.indent * 4) + src);
    }

    end() {
        return this.lines.join('\n');
    }
}

export class WriterContext {

    readonly ctx: CompilerContext;
    #functions: Map<string, { code: string, depends: Set<string> }> = new Map();
    #pendingWriter: Writer | null = null;
    #pendingDepends: Set<string> | null = null;

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }

    //
    // Rendering
    //

    render(debug: boolean = false) {

        // Check dependencies
        let missing = new Set<string>();
        for (let f of this.#functions.values()) {
            for (let d of f.depends) {
                if (!this.#functions.has(d)) {
                    missing.add(d);
                }
            }
        }
        if (missing.size > 0) {
            throw new Error(`Functions ${Array.from(missing).join(', ')} wasn't rendered`);
        }

        // All functions
        let all = Array.from(this.#functions.values());

        // Sort functions
        let sorted = topologicalSort(all, (f) => Array.from(f.depends).map((v) => this.#functions.get(v)!!));

        // Render
        let res = '';
        for (let f of sorted) {
            if (res !== '') {
                res += '\n';
            }
            res += f.code;
        }
        return res;
    }

    //
    // Declaration
    //

    fun(name: string, handler: () => void) {
        if (this.#functions.has(name)) {
            throw new Error(`Function ${name} already defined`); // Should not happen
        }
        if (!!this.#pendingWriter || !!this.#pendingDepends) {
            throw new Error(`Nested function definition is not supported`); // Should not happen
        }


        // Write function
        this.#pendingWriter = new Writer();
        this.#pendingDepends = new Set();
        handler();
        let code = this.#pendingWriter.end();
        let depends = this.#pendingDepends;
        this.#pendingDepends = null;
        this.#pendingWriter = null;
        this.#functions.set(name, { code, depends });
    }

    used(name: string) {
        this.#pendingDepends!!.add(name);
    }

    //
    // Writers
    //

    inIndent = (handler: () => void) => {
        this.#pendingWriter!.inIndent(handler);
    };

    append(src: string = '') {
        this.#pendingWriter!.append(src);
    }
}