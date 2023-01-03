import { TypeRef } from "../../types/types";
import { Writer } from "../../utils/Writer";

export function writeToStack(name: string, ref: TypeRef, w: Writer, optional: boolean = false, forceTuple: boolean = false) {

    //
    // Reference
    //

    if (ref.kind === 'ref') {
        if (ref.optional) {
            w.append(`if (${name} !== null) {`);
            w.inIndent(() => {
                writeToStack(name, { ...ref, optional: false }, w, true, forceTuple);
            });
            w.append('} else {');
            w.inIndent(() => {
                w.append(`__stack.push({ type: 'null' });`);
            });
            w.append('}');
            return;
        }

        if (ref.name === 'Int') {
            w.append(`__stack.push({ type: 'int', value: ${name} });`);
            return;
        } else if (ref.name === 'Bool') {
            w.append(`__stack.push({ type: 'int', value: ${name} ? -1n : 0n });`);
            return;
        } else if (ref.name === 'Cell') {
            w.append(`__stack.push({ type: 'cell', cell: ${name} });`);
            return;
        } else if (ref.name === 'Slice') {
            w.append(`__stack.push({ type: 'slice', cell: ${name} });`);
            return;
        } else if (ref.name === 'Builder') {
            w.append(`__stack.push({ type: 'builder', cell: ${name} });`);
            return;
        } else if (ref.name === 'Address') {
            w.append(`__stack.push({ type: 'slice', cell: beginCell().storeAddress(${name}).endCell() });`);
            return;
        } else if (ref.name === 'String') {
            w.append(`__stack.push({ type: 'slice', cell: beginCell().storeStringTail(${name}).endCell() });`);
            return;
        } else {
            if (optional || forceTuple) {
                w.append(`__stack.push({ type: 'tuple', items: packTuple${ref.name}(${name}) });`);
            } else {
                w.append(`packStack${ref.name}(${name}, __stack);`);
            }
            return;
        }
    }

    //
    // Map
    //

    if (ref.kind === 'map') {
        w.append(`__stack.push({ type: 'cell', cell:  beginCell().storeDict(${name}).endCell() });`);
        return;
    }

    throw Error(`Unsupported type`);
}