import { Cell, Slice, StackItem, Address } from 'ton';
import { BN } from 'bn.js';
import { deploy } from '../abi/deploy';

export type SendParameters = {
    $$type: 'SendParameters';
    bounce: boolean;
    to: Address;
    value: BigInt;
    mode: BigInt;
    body: Cell | null;
}

export type Source = {
    $$type: 'Source';
    a: BigInt;
    b: BigInt;
}
