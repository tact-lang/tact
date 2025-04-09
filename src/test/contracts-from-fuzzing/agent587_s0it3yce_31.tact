struct Outer {
    x: Int;
    y: Inner;
}

struct Inner {
    z: Int;
}

contract PersistentStruct {
    s: Outer;
    init() {
        self.s = Outer{
            x: 5,
            y: Inner{ z: 6 }
        };
    }
    receive() {
        let _ = self.s.y.z;
    }
}