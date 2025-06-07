// test optional builder type persistence
contract TestOptBuilder {
    b: Builder? = null;

    init() {
        self.b = beginCell().storeInt(2, 3);
    }
}
