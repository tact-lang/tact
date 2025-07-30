struct Deeply {
    innermost: String;
}

struct Wrapper {
    mid: Deeply;
    x: Int;
}

struct OuterWrap {
    wrap: Wrapper;
    y: Int;
}

contract NestedWithStrings {
    dat: OuterWrap;

    init() {
        self.dat = OuterWrap{
            wrap: Wrapper{
                mid: Deeply{ innermost: "deep" },
                x: 8,
            },
            y: 7,
        };
    }
}