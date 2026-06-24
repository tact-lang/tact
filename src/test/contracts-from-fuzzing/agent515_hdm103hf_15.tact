struct Deeply {
    str: String;
    nestedOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract ComplexOptional {
    bigOpt: Deeply?;

    init() {
        self.bigOpt = Deeply{
            str: "deep",
            nestedOpt: Inner{ val: 7, flag: true }
        };
    }
}
