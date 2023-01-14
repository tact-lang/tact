import fs from 'fs';
import path from 'path';

// Pack func
let wasmBase64 = fs.readFileSync(path.resolve(__dirname, '..', 'src', 'func', 'funcfiftlib.wasm')).toString('base64');
let wasmBase64js = `module.exports = { FuncFiftLibWasm: '${wasmBase64}' };`;
fs.writeFileSync(path.resolve(__dirname, '..', 'src', 'func', 'funcfiftlib.wasm.js'), wasmBase64js);