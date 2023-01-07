import { trimIndent } from "./text";

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

    write(src: string) {
        let lines = trimIndent(src).split('\n');
        for (let l of lines) {
            this.append(l);
        }
    }

    end() {
        return this.lines.join('\n');
    }
}