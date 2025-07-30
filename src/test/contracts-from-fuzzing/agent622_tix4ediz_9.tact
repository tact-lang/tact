struct Inner {
    x: Int = 10;
    y: Bool?;
}

struct Wrapper {
    inner: Inner?;
    flag: Bool = true;
}

contract OptionalNestedDefaults {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: null,
            flag: false
        };
    }
}