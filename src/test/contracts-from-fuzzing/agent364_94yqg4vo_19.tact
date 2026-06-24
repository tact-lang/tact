struct Inner {
    x: Int as uint8;
    y: Int as int16;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract MixedSerializationPersist {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 250, y: -12345 },
            flag: true
        };
    }
}