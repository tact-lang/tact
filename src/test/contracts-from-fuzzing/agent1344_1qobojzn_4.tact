struct InnerMost {
    flag: Bool;
    note: String?;
}

struct Middle {
    inner: InnerMost?;
    count: Int;
}

struct Outer {
    middle: Middle?;
}

contract OptionalNestTest {
    stash: Outer;

    init() {
        self.stash = Outer{
            middle: Middle{
                inner: InnerMost{flag: true, note: null},
                count: 42
            }
        };
    }
}
