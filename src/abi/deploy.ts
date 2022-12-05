import { createExecutorFromCode, ExecuteError } from 'ton-nodejs';
import { Cell, StackItem } from 'ton';

export async function deploy(code: string, name: string, args: StackItem[]) {

    // Create executor
    let codeCell = Cell.fromBoc(Buffer.from(code, 'base64'))[0];
    let executor = await createExecutorFromCode({
        code: codeCell,
        data: new Cell()
    });

    // Execute
    try {
        let res = await executor.get(name, args, { debug: true });
        let data = res.stack.readCell();

        return {
            code: codeCell,
            data
        };
    } catch (e) {
        if (e instanceof ExecuteError) {
            console.warn(e.debugLogs);
        }
        throw e;
    }
}