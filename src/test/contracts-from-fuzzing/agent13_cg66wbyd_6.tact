struct InnerOpt {
    foo: Int;
    bar: Bool?;
}

contract Test {
    opt: InnerOpt?;

    init() {
        self.opt = InnerOpt{ foo: 7, bar: null };
    }
}
