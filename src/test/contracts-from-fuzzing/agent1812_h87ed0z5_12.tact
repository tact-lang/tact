struct NestedStructWithDefaults {
    inner: Inner;
}

struct Inner {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract NestedDefaultsContract {
    data: NestedStructWithDefaults;

    init() {
        self.data = NestedStructWithDefaults{
            inner: Inner{}
        };
    }
}