struct Nested {
    level1: Int;
    level2: Inner;
}

struct Inner {
    intField: Int;
    optBool: Bool?;
}

contract DeepTest {
    nst: Nested;

    init() {
        self.nst = Nested{
            level1: 1,
            level2: Inner{
                intField: 2,
                optBool: null
            }
        };
    }
}