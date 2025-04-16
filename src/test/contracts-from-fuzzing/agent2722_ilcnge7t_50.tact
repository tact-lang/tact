// alternate order nested structs with complex defaults

struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Mid {
    z: String = "abc";
    inner: Inner;
}

contract AltOrderNested {
    rec: Mid = Mid {
        z: "test",
        inner: Inner { x: 99, y: false }
    };

    init() {
        self.rec = Mid {
            z: "hello",
            inner: Inner { x: 42, y:true }
        };
    }
}