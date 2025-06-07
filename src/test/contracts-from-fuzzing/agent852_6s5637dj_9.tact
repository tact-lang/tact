struct SInner {
    a: Int;
    b: String;
    c: Bool?;
}

struct SMid {
    x: Int;
    y: SInner;
    z: Bool;
}

contract OptionalMid {
    middle: SMid?;

    init() {
        self.middle = null;
    }
}