struct Sub {
    a: Int;
    b: Bool;
}

contract LargeOptionalStruct {
    s: Sub?;

    init() {
        self.s = null;
    }
}