contract MyContract {
    receive() {
        let s: Slice = beginCell().storeUint(123, 64).endCell().asSlice();
        let r: Int = s.loadUint(1);
        s.skipBits(1);
        let x: Slice = s.skipBits(1);
    }
}