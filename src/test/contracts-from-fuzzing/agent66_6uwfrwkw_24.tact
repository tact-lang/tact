struct Inner {
    a: Int?;
    b: Int;
}

struct Middle {
    inner: Inner?;
    c: Int?;
}

contract MixOptDeep {
    state: Middle;

    init() {
        self.state = Middle{
            inner: null,
            c: null
        };
    }
}