struct Inner {
    a: Int = 5;
    b: Bool = true;
}

struct Outer {
    x: String = "x";
    y: Inner;
    z: String = "z";
}

contract StructMiddleStruct {
    s: Outer;

    init() {
        self.s = Outer{
            y: Inner{}
        };
    }
}