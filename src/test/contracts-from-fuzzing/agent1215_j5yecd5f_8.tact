contract DefaultVals {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address; // uninitialized, must use init

    init() {
        self.baz = myAddress();
    }
}