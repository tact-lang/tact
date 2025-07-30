struct Inner {
    i: Int;
    s: String?;
}

struct Outer {
    flag: Bool;
    inner: Inner;
}

contract ComplexStorage {
    nestedData: Outer;

    init() {
        self.nestedData = Outer{
            flag: true,
            inner: Inner{
                i: 100,
                s: null,
            },
        };
    }
}