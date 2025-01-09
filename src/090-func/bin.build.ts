import fs from "fs";
import path from "path";

const fromPath = path.resolve(__dirname, "funcfiftlib.wasm");
const toPath = path.resolve(__dirname, "funcfiftlib.wasm.js");

// Pack func
const wasmBase64 = fs.readFileSync(fromPath).toString("base64");
const wasmBase64js = `module.exports = { FuncFiftLibWasm: '${wasmBase64}' };`;
fs.writeFileSync(toPath, wasmBase64js);
