struct OptionalStruct {
    n: Int?;
    s: String?;
    b: Bool?;
    addr: Address?;
}

contract Foo {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            n: null,
            s: null,
            b: null,
            addr: null
        };
    }
}