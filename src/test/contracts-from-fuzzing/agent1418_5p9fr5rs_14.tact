struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    s: Inner;
}

contract DeepAssign {
    o: Outer;

    init() {
        self.o = Outer{
            x: 9,
            s: Inner{
                a: 19,
                b: true,
            }
        };
    }
}