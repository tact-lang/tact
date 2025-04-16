// test nested optional-in-optional scenario
struct Inner {
    x: Int?;
}

struct Middle {
    inner: Inner?;
}

contract NestedOptInOpt {
    m: Middle?;

    init() {
        self.m = Middle{inner: null};
    }
}