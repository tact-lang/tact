import fs from "fs";
import path from "path";

const sourcePath = path.resolve(__dirname, "funcfiftlib.wasm");
const targetPath = path.resolve(__dirname, "funcfiftlib.wasm.js");

const wasmBase64 = fs.readFileSync(sourcePath).toString("base64");
const wasmBase64js = `module.exports = { FuncFiftLibWasm: '${wasmBase64}' };`;
fs.writeFileSync(targetPath, wasmBase64js);
