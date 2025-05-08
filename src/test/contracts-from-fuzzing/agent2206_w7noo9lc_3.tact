struct Inner {
    val: Int;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    text: String;
    cond: Bool?;
}

contract Test3 {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{ val: 5, flag: true },
            text: "deep",
            cond: null
        };
    }
}
