struct Inner {
    flag: Bool;
    nickname: String;
}

struct Outer {
    id: Int;
    optInner: Inner?;
}

contract OptionalNested {
    outer: Outer;
    init() {
        self.outer = Outer{
            id: 7,
            optInner: null
        };
    }
}