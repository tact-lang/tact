struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Address?;
}

contract Test {
    opt: MultiOptional;

    init() {
        self.opt = MultiOptional{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}