contract TestDumpBuilder {
    receive() {
        let builder = beginCell();
        builder.storeUint(255, 8);
        dump(builder);
    }
}
