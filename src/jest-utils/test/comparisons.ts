import { Address, Cell, Slice } from "@ton/core";
import { CompareResult } from "@/jest-utils/test/interface";

export function compareCellForTest(subject: any, cmp: Cell): CompareResult {
    return {
        pass: cmp.equals(subject),
        posMessage: ((subject: any, cmp: Cell) =>
            `Expected\n${subject}\nto equal\n${cmp}`).bind(
            undefined,
            subject,
            cmp,
        ),
        negMessage: ((subject: any, cmp: Cell) =>
            `Expected\n${subject}\nNOT to equal\n${cmp}\nbut it does`).bind(
            undefined,
            subject,
            cmp,
        ),
    };
}

export function compareAddressForTest(
    subject: any,
    cmp: Address,
): CompareResult {
    return {
        pass: cmp.equals(subject),
        posMessage: ((subject: any, cmp: Address) =>
            `Expected ${subject} to equal ${cmp}`).bind(
            undefined,
            subject,
            cmp,
        ),
        negMessage: ((subject: any, cmp: Address) =>
            `Expected ${subject} NOT to equal ${cmp}, but it does`).bind(
            undefined,
            subject,
            cmp,
        ),
    };
}

export function compareSliceForTest(subject: any, cmp: Slice): CompareResult {
    return {
        pass: cmp.asCell().equals(subject.asCell()),
        posMessage: ((subject: any, cmp: Slice) =>
            `Expected\n${subject}\nto equal\n${cmp}`).bind(
            undefined,
            subject,
            cmp,
        ),
        negMessage: ((subject: any, cmp: Slice) =>
            `Expected\n${subject}\nNOT to equal\n${cmp}\nbut it does`).bind(
            undefined,
            subject,
            cmp,
        ),
    };
}
