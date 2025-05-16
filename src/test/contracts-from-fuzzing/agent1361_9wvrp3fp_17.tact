struct Inner {
    foo: Int as uint8;
    bar: Int as int16;
}

struct Mid {
    x: Bool;
    y: Inner;
}

contract NestedExplicitFormats {
    info: Mid;

    init() {
        self.info = Mid{x:true, y: Inner{foo: 255, bar: -12345}};
    }
}