struct Inner {
    b: Bool?;
}

struct Middle {
    inner: Inner?;
}

contract NestedNullable {
    m: Middle;

    init() {
        self.m = Middle{inner: null};
    }
}