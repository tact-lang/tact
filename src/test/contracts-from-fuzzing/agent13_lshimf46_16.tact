contract TestSliceAsAddressUnsafe {
    receive() {
        // Build a cell that does not contain a valid address structure,
        // then unsafely cast its slice to an Address.
        // This should compile even though at runtime this might lead to undefined behavior.
        let c: Cell = beginCell().storeUint(42, 8).endCell();
        let s: Slice = c.asSlice();
        let a: Address = s.asAddressUnsafe();
        // Dump the string representation of the unsafely cast address.
        dump(a.toString());
    }
}
