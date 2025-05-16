struct Inner {
    small: Int as uint8;
    medium: Int as int16;
}

struct Outer {
    big: Int;
    inner: Inner;
}

contract SerializationAnnotations {
    data: Outer;

    init() {
        self.data = Outer{
            big: 1000,
            inner: Inner{
                small: 200,
                medium: -12345,
            },
        };
    }
}