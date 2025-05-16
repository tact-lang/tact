contract TestSliceEquality {
    receive() {
        let cell1 = beginCell().storeUint(123, 8).endCell();
        let cell2 = beginCell().storeUint(123, 8).endCell();
        let slice1 = cell1.asSlice();
        let slice2 = cell2.asSlice();
        let eq = (slice1 == slice2) ? 1 : 0;
        dump(eq); // expected output: 1
    }
}
