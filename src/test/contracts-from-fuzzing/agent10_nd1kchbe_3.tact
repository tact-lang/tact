struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    p1: Inner;
    p2: Inner;
}

contract StructOfStructs {
    data: Outer;

    init() {
        self.data = Outer{
            p1: Inner{ x: 1, y: 2 },
            p2: Inner{ x: 3, y: 4 }
        };
    }
}