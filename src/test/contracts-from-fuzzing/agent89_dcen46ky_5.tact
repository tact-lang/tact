struct OptionalStruct {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract Fuzz5 {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}