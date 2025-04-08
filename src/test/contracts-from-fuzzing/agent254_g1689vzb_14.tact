struct StrWrap {
    field: String;
}

struct AddrWrap {
    field: Address;
}

struct BoolWrap {
    field: Bool;
}

struct IntWrap {
    field: Int;
}

contract WrappedFields {
    s: StrWrap;
    a: AddrWrap;
    b: BoolWrap;
    i: IntWrap;

    init() {
        self.s = StrWrap{ field: "test" };
        self.a = AddrWrap{ field: myAddress() };
        self.b = BoolWrap{ field: true };
        self.i = IntWrap{ field: 42 };
    }
}