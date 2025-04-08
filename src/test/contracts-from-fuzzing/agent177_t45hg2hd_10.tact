struct S {
    a: Int = 1;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract NestedOptionalContract {
    optField: S? = null;

    init() {
        self.optField = null;
    }
    receive(){}
}