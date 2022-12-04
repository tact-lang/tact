import { Cell, Slice, StackItem } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Source = {
    a: BigInt;
    b: BigInt;
    c: BigInt;
    d: BigInt;
}
