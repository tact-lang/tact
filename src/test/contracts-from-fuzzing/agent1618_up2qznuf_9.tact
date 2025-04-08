struct Inner {
    x: Int;
    y: Bool = true;
    z: String;
}

struct Outer {
    inner: Inner;
    num: Int = 42;
}

contract MixedNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{x: 10, y: false, z: "hi"},
            num: 100
        };
    }
}