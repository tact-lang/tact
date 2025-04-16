struct Inner {
    val: Bool?;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
    opt: Int?;
}

contract DeepNestedTest {
    nestedData: Outer;

    init() {
        self.nestedData = Outer{
            middle: Middle{
                inner: Inner{
                    val: false,
                },
            },
            opt: null,
        };
    }
}