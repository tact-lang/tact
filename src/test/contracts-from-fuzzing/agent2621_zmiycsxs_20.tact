struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract Test {
    s: OptionalStruct?;
    init() {
        self.s = null;
    }
}