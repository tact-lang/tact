contract SelfRef {
    init() {
        // Self-referential initialization
        let s = initOf SelfRef();
        let addr = contractAddress(s);
    }
}
