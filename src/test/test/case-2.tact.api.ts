import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type StateInit = {
    $$type: 'StateInit';
    code: Cell;
    data: Cell;
}

export type Source = {
    $$type: 'Source';
    a: BigInt;
    b: BigInt;
}
