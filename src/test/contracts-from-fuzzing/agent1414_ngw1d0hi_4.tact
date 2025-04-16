struct Inner {
    value: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNestTest {
    record: Outer;

    init() {
        self.record = Outer{
            middle: Middle{
                inner: Inner{
                    value: 123
                }
            }
        };
    }
}