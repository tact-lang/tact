// persistent fields: nested optional struct containing primitive seialized variesties
struct Prims {
    a: Int as int64;
    b: Int as uint64;
    c: Bool;
    d: Bool?;
}

struct OptInner {
    x: Prims?;
}

contract MixedOptPrimSerialize {
    data: OptInner?;

    init() {
        self.data = null;
    }
}