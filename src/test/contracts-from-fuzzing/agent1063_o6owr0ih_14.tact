struct InnerA { x: Int; }
struct InnerB { y: Bool; }
struct InnerC { z: String; }

struct Container {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

contract MultiNested {
    val: Container;

    init() {
        self.val = Container{
            a: InnerA{ x: 1 },
            b: InnerB{ y: false },
            c: InnerC{ z: "hi" }
        };
    }
}