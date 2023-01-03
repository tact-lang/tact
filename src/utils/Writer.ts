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