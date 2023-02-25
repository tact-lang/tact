import fs from 'fs';
import path from 'path';
import glob from 'glob';

// Pack func
let wasmBase64 = fs.readFileSync(path.resolve(__dirname, '..', 'src', 'func', 'funcfiftlib.wasm')).toString('base64');
let wasmBase64js = `module.exports = { FuncFiftLibWasm: '${wasmBase64}' };`;
fs.writeFileSync(path.resolve(__dirname, '..', 'src', 'func', 'funcfiftlib.wasm.js'), wasmBase64js);

// Pack stdlib
let t = glob.sync(path.resolve(__dirname, '..', 'stdlib', '**', '*.@(tact|fc)'));
let output: string = '';
output = 'let files: { [key: string]: string } = {};\n';
for (let f of t) {
    let code = fs.readFileSync(f).toString('base64');
    let name = f.replace(path.resolve(__dirname, '..', 'stdlib'), ''); // Thanks ChatGPT
    output += `files['${name}'] =\n`;
    let first = true;
    while (code.length > 0) {
        if (first) {
            first = false;
        } else {
            output += ' +\n';
        }
        output += `    '${code.slice(0, 128)}'`;
        code = code.slice(128);
    }
    output += `;\n`;
}
output += 'export default files;';
fs.writeFileSync(path.resolve(__dirname, '..', 'src', 'imports', 'stdlib.ts'), output);