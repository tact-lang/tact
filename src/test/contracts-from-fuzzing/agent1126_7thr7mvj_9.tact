struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

struct Outer {
    x: Int;
    y: Inner?;
    z: Bool;
}

contract NestedStructContract {
    outerData: Outer;

    init() {
        self.outerData = Outer{
            x: 7,
            y: Inner{
                a: 42,
                b: false,
                c: "hi",
            },
            z: true,
        };
    }

    receive() {
        let sum = self.outerData.x;
        if (self.outerData.y != null) {
            let _inner = self.outerData.y!!;
            let add: Int = 0;
            if (_inner.b) {
                add = 1;
            } else {
                add = 0;
            }
            let _ = _inner.a + add;
            if (_inner.c != null) {
                let _ = _inner.c!!;
            }
        }
        let outer_add: Int = 0;
        if (self.outerData.z) {
            outer_add = 1;
        } else {
            outer_add = 0;
        }
        let _ = outer_add;
    }
}