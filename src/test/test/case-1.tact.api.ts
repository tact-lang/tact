import { Cell, Slice, StackItem, Address } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type Source = {
    $$type: 'Source';
    a: BigInt;
    b: BigInt;
    c: BigInt;
    d: BigInt;
}
