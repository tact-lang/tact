struct InnerMost {
    value: Int;
    flag: Bool;
    note: String;
}

struct Middle {
    im: InnerMost;
    id: Int;
}

struct OuterMost {
    mid: Middle;
    text: String;
}

contract NestedDeep {
    payload: OuterMost;

    init() {
        self.payload = OuterMost{
            mid: Middle{
               im: InnerMost{value: 77, flag: true, note: "deep"},
               id: 123
            },
            text: "done"
        };
    }
}
