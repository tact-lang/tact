struct Sub {
    value: Int = 7;
    tag: String?; // optional, default null
}

struct BigOptionals {
    optInt: Int?; // null
    optBool: Bool?; // null
    optAddr: Address?; // null
    optStr: String? = "hello";
    optCell: Cell?; // null
    optSlice: Slice?; // null
    optSub1: Sub?; // null
    optSub2: Sub?; // null
}

contract TestContract {
    big: BigOptionals;

    init() {
        self.big = BigOptionals{
            optInt: 123,
            optBool: true,
            optAddr: null,
            optStr: "world",
            optCell: emptyCell(),
            optSlice: emptyCell().asSlice(),
            optSub1: Sub{ value: 99, tag: "ok" },
            optSub2: null
        };
    }

    receive() {}
}