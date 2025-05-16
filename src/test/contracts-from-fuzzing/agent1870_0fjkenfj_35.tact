struct SInner {
    x: Int;
    y: String;
    z: Bool;
}

struct Container {
    s: SInner;
}

contract StructInStructStorage {
    c: Container;
    init() {
        self.c = Container {
            s: SInner{
                x: 1,
                y: "abc",
                z: true
            }
        };
    }
}
