contract DebugSlice {
    receive() {
        let s = beginCell().storeUint(1, 4).endCell().beginParse();
        dump(s);
    }
}
