export class CodeBuilder {
    private parts: string[] = [];
    private currentIndent: string = "";
    private readonly indentStack: string[] = [];
    private atLineStart: boolean = true;

    public constructor(private readonly indentStr: string = "    ") {}

    private addPart(part: string): this {
        if (part.length === 0) return this;

        if (this.atLineStart) {
            this.parts.push(this.currentIndent);
            this.atLineStart = false;
        }
        this.parts.push(part);
        return this;
    }

    public add(part: string): this {
        this.addPart(part);
        return this;
    }

    public addIf(cond: boolean, part: string): this {
        if (cond) {
            this.addPart(part);
        }
        return this;
    }

    public space(): this {
        if (!this.atLineStart) {
            this.parts.push(" ");
        }
        return this;
    }

    public apply<T>(
        callback: (code: CodeBuilder, node: T) => void,
        node: T,
    ): this {
        callback(this, node);
        return this;
    }

    public applyOpt<T>(
        callback: (code: CodeBuilder, node: T) => void,
        node: undefined | T,
    ): this {
        if (!node) return this;
        callback(this, node);
        return this;
    }

    public newLine(): this {
        this.parts.push("\n");
        this.atLineStart = true;
        return this;
    }

    public newLines(count: number): this {
        if (count <= 0) {
            return this;
        }

        for (let i = 0; i < count; i++) {
            this.newLine();
        }
        this.atLineStart = true;
        return this;
    }

    public indent(): this {
        this.indentStack.push(this.currentIndent);
        this.currentIndent += this.indentStr;
        return this;
    }

    public dedent(): this {
        const last = this.indentStack.pop();
        if (last !== undefined) {
            this.currentIndent = last;
        }
        return this;
    }

    public indentCustom(len: number): this {
        this.indentStack.push(this.currentIndent);
        this.currentIndent = " ".repeat(len);
        return this;
    }

    public lineLength(): number {
        let sum = 0;
        for (let i = 0; i < this.parts.length; i++) {
            const index = this.parts.length - 1 - i;
            const element = this.parts[index];
            if (typeof element !== "undefined" && element !== "\n") {
                sum += element.length;
                continue;
            }
            break;
        }
        return sum;
    }

    public trimNewlines(): this {
        let toRemove = 0;
        for (; toRemove < this.parts.length; toRemove++) {
            const index = this.parts.length - 1 - toRemove;
            const element = this.parts[index];
            if (element === "\n") {
                continue;
            }
            break;
        }
        this.parts = this.parts.slice(0, this.parts.length - toRemove);
        return this;
    }

    public toString(): string {
        return this.parts.join("");
    }
}
