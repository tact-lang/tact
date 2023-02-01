import { enabledDebug } from "../config";
import { CompilerContext } from "../context";
import { topologicalSort } from "../utils/utils";
import { Writer } from "../utils/Writer";

export class WriterContext {

    readonly ctx: CompilerContext;
    #functions: Map<string, { name: string, code: string, depends: Set<string> }> = new Map();
    #pendingWriter: Writer | null = null;
    #pendingDepends: Set<string> | null = null;
    #pendingName: string | null = null;
    #nextId = 0;
    #headers: string[] = [];

    constructor(ctx: CompilerContext) {
        this.ctx = ctx;
    }

    allocateNextRandomName() {
        return `__gen_internal_${this.#nextId++}`;
    }

    clone() {
        let res = new WriterContext(this.ctx);
        res.#functions = new Map(this.#functions);
        res.#nextId = this.#nextId;
        res.#headers = [...this.#headers];
        return res;
    }

    //
    // Rendering
    //

    render(debug: boolean = false) {

        // Check dependencies
        let missing = new Map<string, string[]>();
        for (let f of this.#functions.values()) {
            for (let d of f.depends) {
                if (!this.#functions.has(d)) {
                    if (!missing.has(d)) {
                        missing.set(d, [f.name]);
                    } else {
                        missing.set(d, [...missing.get(d)!!, f.name]);
                    }

                }
            }
        }
        if (missing.size > 0) {
            throw new Error(`Functions ${Array.from(missing.keys()).map((v) => `"${v}"`).join(', ')} wasn't rendered`);
        }

        // All functions
        let all = Array.from(this.#functions.values());

        // Remove unused
        if (!debug) {
            let used = new Set<string>();
            let visit = (name: string) => {
                used.add(name);
                let f = this.#functions.get(name)!!;
                for (let d of f.depends) {
                    visit(d);
                }
            }
            visit('$main');
            all = all.filter((v) => used.has(v.name));
        }

        // Sort functions
        let sorted = topologicalSort(all, (f) => Array.from(f.depends).map((v) => this.#functions.get(v)!!));

        // Render
        let res = '';
        for (let h of this.#headers) {
            if (res !== '') {
                res += '\n';
            }
            res += h;
        }
        for (let f of sorted) {
            if (res !== '') {
                res += '\n\n';
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

        // console.log(`Rendering: "${name}"`);

        // Write function
        this.#pendingWriter = new Writer();
        this.#pendingDepends = new Set();
        this.#pendingName = name;
        handler();
        let code = this.#pendingWriter.end();
        let depends = this.#pendingDepends;
        this.#pendingDepends = null;
        this.#pendingWriter = null;
        this.#pendingName = null;
        this.#functions.set(name, { name, code, depends });
    }

    used(name: string) {
        if (this.#pendingName !== name) {
            this.#pendingDepends!!.add(name);
        }
        return name;
    }

    currentContext() {
        return this.#pendingName;
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

    write(src: string = '') {
        this.#pendingWriter!.write(src);
    }

    debug(id?: number | undefined | null | string) {
        if (enabledDebug(this.ctx)) {
            if (typeof id === 'string') {
                this.used('__tact_debug_str');
                this.append(`__tact_debug_str("${id}");`);
            } else {
                this.used('__tact_debug');
                let v = (id === undefined || id === null) ? (this.#nextId++) : id;
                this.append(`__tact_debug(${v});`);
            }
        }
    }

    //
    // Headers
    //

    header(src: string) {
        this.#headers.push(src);
    }
}