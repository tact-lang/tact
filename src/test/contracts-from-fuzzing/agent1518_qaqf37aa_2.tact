struct Nested {
    flag: Bool;
    count: Int as uint8;
}

struct Outer {
    inner1: Nested;
    inner2: Nested;
    optionalInner: Nested?;
}

contract Test {
    data: Outer = Outer{
        inner1: Nested{flag: true, count: 1},
        inner2: Nested{flag: false, count: 2},
        optionalInner: null
    };

    init() {
        self.data = Outer{
            inner1: Nested{flag: false, count: 3},
            inner2: Nested{flag: true, count: 4},
            optionalInner: null
        };
    }
}