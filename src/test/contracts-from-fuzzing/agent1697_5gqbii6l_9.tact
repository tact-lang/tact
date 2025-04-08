struct NestedStructDefaults {
    inner: Inner;
}

struct Inner {
    x: Int = 10;
    y: Int?;   
}

contract TestContract {
    s: NestedStructDefaults;

    init() {
        self.s = NestedStructDefaults{
            inner: Inner{
                y: null
            }
        };
    }
}