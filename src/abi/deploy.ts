import { createExecutorFromCode, ExecuteError } from 'ton-nodejs';
import { beginCell, Cell, serializeDict, StackItem } from 'ton';

export async function deploy(code: string, name: string, args: StackItem[]) {

    // System data
    let codeCell = Cell.fromBoc(Buffer.from(code, 'base64'))[0];
    let systemData = new Map<string, Cell>();
    systemData.set('0', codeCell);

    // Create system cell
    let systemCell = beginCell()
        .storeDict(serializeDict(systemData, 32, (src, v) => v.refs.push(src)));

    // Create executor
    let executor = await createExecutorFromCode({
        code: codeCell,
        data: new Cell()
    });
    args = [{ type: 'cell', cell: systemCell.endCell() }, ...args];

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