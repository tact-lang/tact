struct OptionalsOfStructs {
    s1: Inner?;
    s2: Inner?;
}

struct Inner {
    i: Int;
    b: Bool;
}

contract OptionalsOfStructsTest {
    optStructs: OptionalsOfStructs;

    init() {
        self.optStructs = OptionalsOfStructs{
            s1: null,
            s2: null,
        };
    }
}