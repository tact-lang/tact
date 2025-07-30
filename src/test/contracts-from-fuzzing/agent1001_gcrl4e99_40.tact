// Now test optional wrapping a struct with serialization format

struct TinyS {
    x: Int as uint4;
}

struct Wrap {
    inner: TinyS?;
    y: Int as uint8;
}

contract OptionalStructFormat {
    val: Wrap;

    init() {
        self.val = Wrap{
            inner: null,
            y: 250
        };
    }
}