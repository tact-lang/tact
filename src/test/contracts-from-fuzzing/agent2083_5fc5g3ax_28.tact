struct NestedStructOpt {
    opt: Int?;
    txt: String;
}

struct WrapperS {
    nested: NestedStructOpt?;
    flag: Bool;
}

contract StructWithNestedOpt {
    s: WrapperS;

    init() {
        self.s = WrapperS{
            nested: null,
            flag: true,
        };
    }
}
