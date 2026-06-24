contract TestReturnBuilder {
    receive() {}
    
    get fun getBuilder(): Builder {
        let b: Builder = beginCell();
        b = b.storeUint(99, 8);
        return b;
    }
}
