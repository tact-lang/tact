struct Middle {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    m1: Middle;
    m2: Middle;
    m3: Middle;
}

contract TestContract {
    store: Outer;
    init() {
        self.store = Outer{
            m1: Middle{ x: 1, y: true, z: "a" },
            m2: Middle{ x: 2, y: false, z: "b" },
            m3: Middle{ x: 3, y: true, z: "c" }
        };
    }
}