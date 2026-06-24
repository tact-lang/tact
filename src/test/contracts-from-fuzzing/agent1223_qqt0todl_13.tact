struct Inner {
    s: String? = "hello";
    n: Int? = 5;
}

struct Outer {
    inner: Inner = Inner{};
}

contract OverrideDefaults {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                s: null,
                n: null,
            }
        };
    }
}