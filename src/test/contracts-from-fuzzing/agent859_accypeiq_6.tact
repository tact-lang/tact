struct StrNestedInner {
    text: String;
    value: Int;
}

struct StrNestedMid {
    inner: StrNestedInner;
    note: String;
}

struct StrNestedOuter {
    mid: StrNestedMid;
    info: String;
    flag: Bool;
}

contract NestedWithStrings {
    store: StrNestedOuter;

    init() {
        self.store = StrNestedOuter{
            mid: StrNestedMid{
                inner: StrNestedInner{
                    text: "inner",
                    value: 42
                },
                note: "middle"
            },
            info: "outer",
            flag: true
        };
    }
}
