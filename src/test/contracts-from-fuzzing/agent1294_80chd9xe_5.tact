struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner1: Inner;
    inner2: Inner?;
    num: Int;
    flag: Bool;
    text: String?;
}

contract NestedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ x: null, y: true },
            inner2: null,
            num: 7,
            flag: false,
            text: null
        };
    }
}
