struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalCombo1 {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}
