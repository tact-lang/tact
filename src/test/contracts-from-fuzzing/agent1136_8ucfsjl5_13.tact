contract MixedSerializationFormats {
    info: Outer;

    init() {
        self.info = Outer{
            id: 1,
            inner: Inner{
                small: 3,
                big: 5
            }
        };
    }
}

struct Outer {
    id: Int as uint16;
    inner: Inner;
}

struct Inner {
    small: Int as uint4;
    big: Int as int257;
}
