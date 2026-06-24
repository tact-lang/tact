struct Deep {
    level: Int = 1;
    deeper: Inner?;   // optional nested struct
}

struct Inner {
    value: Int = 2;
    flag: Bool = true;
}

contract NestedOptionalTest {
    state: Deep;

    init() {
        self.state = Deep{
            level: 10,
            deeper: Inner{value: 42, flag: false}
        };
    }
}