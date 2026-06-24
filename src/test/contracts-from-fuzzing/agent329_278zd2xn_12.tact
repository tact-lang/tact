struct OptionalNestedStruct {
    a: Int;
    b: Bool;
    c: String?;
    d: Bool?;
}

contract TestContract {
    param: OptionalNestedStruct?;

    init() {
        self.param = null;
    }
}