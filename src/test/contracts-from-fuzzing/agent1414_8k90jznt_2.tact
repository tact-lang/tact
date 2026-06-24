struct InnerMost {
    flag: Bool;
    count: Int?;
}

struct MidLevel {
    description: String;
    inner: InnerMost;
}

struct Outer {
    number: Int;
    mid: MidLevel?;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer {
            number: 42,
            mid: null
        };
    }
}