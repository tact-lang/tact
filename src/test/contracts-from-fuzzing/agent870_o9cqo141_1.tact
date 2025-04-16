struct Inner {
    nestedVal: Int = 1;
    optNested: Bool?;
}

struct Outer {
    inner: Inner;
    status: Bool = true;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{}, status: false };
    }
}