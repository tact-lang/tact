import { Cell, CommentMessage, readString, stringToCell } from 'ton';
import { createExecutorFromCode } from 'ton-nodejs';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { StringsTester, StringsTester_init } from './features/output/strings_StringsTester';

function stringToCommentCell(src: string) {
    let c = new Cell();
    new CommentMessage(src).writeTo(c);
    return c;
}

describe('feature-strings', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should implement strings correctly', async () => {

        // Init
        let init = await StringsTester_init();
        let executor = await createExecutorFromCode(init);
        let contract = new StringsTester(executor);

        // Check methods
        expect(await contract.getConstantString()).toBe('test string');
        expect(await contract.getConstantStringUnicode()).toBe('привет мир 👀');
        const l = 'привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀';
        expect(await contract.getConstantStringUnicodeLong()).toBe(l);
        expect((await contract.getDynamicStringCell()).equals(stringToCell('Hello!'))).toBe(true);
        expect((await contract.getDynamicCommentCell()).equals(stringToCommentCell('Something something world!'))).toBe(true);
        const l2 = 'Hello!привет мир 👀 привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀привет мир 👀';
        expect((await contract.getDynamicCommentCellLarge()).equals(stringToCell(l2))).toBe(true);
        expect((await contract.getDynamicCommentStringLarge())).toEqual(l2);
        expect((await contract.getStringWithNumber())).toEqual('Hello, your balance: 123');
        expect((await contract.getStringWithLargeNumber())).toEqual('Hello, your balance: 1000000000000000000000000000000000000000000000000000000000000');
        expect((await contract.getStringWithNegativeNumber())).toEqual('Hello, your balance: -123');

        expect((await contract.getStringWithFloat())).toEqual('9.5');
    });
});