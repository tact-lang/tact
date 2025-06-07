struct Inner {
    str: String;
}

struct Outer {
    a: Int;
    inner: Inner;
    b: Bool?;
}

contract MixedTypeStorage {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            inner: Inner{ str: "data" },
            b: null
        };
    }
}