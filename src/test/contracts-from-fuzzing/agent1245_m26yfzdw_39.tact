struct InnerLayer {
    foo: Int;
}

struct MidLayer {
    inner: InnerLayer;
    flag: Bool;
}

contract Layered {
    level: MidLayer;

    init() {
        self.level = MidLayer{
            inner: InnerLayer{ foo: 42 },
            flag: true
        };
    }
}
