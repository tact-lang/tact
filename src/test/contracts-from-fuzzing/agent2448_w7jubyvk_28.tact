struct PartOpt {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract PartialOpts {
    s: PartOpt;
    
    init() {
        self.s = PartOpt{
            foo: 3,
            bar: null,
            baz: "abc",
        };
    }
}
