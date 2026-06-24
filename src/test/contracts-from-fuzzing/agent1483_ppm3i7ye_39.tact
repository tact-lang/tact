struct OptPrims {
    a: Builder? = null;
    b: Cell? = null;
    c: Slice? = null;
    d: Address? = null;
    e: String? = null;
    f: Bool? = null;
}

contract OptPrimsStruct {
    data: OptPrims;

    init() {
        self.data = OptPrims{};
    }
}