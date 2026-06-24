struct Inner {
    x: Int;
    y: Bool?;
    z: String = "ok";
    w: Address? = null;
}

struct Outer {
    a: Int;
    b: Inner;
    c: String;
    d: Cell?;
}

contract Test {
    state: Outer;
    init() {
        self.state = Outer {
            a: 10,
            b: Inner { x: 11, y: null, z: "hi", w: null },
            c: "hello",
            d: null
        };
    }
}