import { TypeRef } from "../../types/types";
import { Writer } from "../Writer";

export function writeToStack(name: string, ref: TypeRef, w: Writer) {

    //
    // Reference
    //

    if (ref.kind === 'ref') {
        if (ref.optional) {
            w.append(`if (${name} !== null) {`);
            w.inIndent(() => {
                writeToStack(name, { ...ref, optional: false }, w);
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
            w.append(`__stack.push({ type: 'int', value: ${name} ? new BN(-1) : new BN(0) });`);
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
        } else {
            w.append(`packStack${ref.name}(${name}, __stack);`);
            return;
        }
    }

    //
    // Map
    //

    if (ref.kind === 'map') {
        w.append(`__stack.push({ type: 'cell', cell: ${name}});`);
        return;
    }

    throw Error(`Unsupported type`);
}