import { resolve } from "path";
import { runTest } from "@/next/test/_test.build";

const main = async () => {
    const path = resolve(process.argv[2] ?? "");
    console.log(await runTest(path));
};

void main();
