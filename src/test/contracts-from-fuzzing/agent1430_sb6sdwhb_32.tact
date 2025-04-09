struct ThreeLevel {
    a: Int;
    b: Nested;
}

struct Nested {
    inner: InnerMost;
}

struct InnerMost {
    flag: Bool;
}

contract DeepTest {
    v: ThreeLevel;

    init() {
        self.v = ThreeLevel{
            a: 1,
            b: Nested{
                inner: InnerMost{
                    flag: true
                }
            }
        };
    }
}
