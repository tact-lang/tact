struct Inner {
    foo: Int?;
}

struct Outer {
    in1: Inner?;
    in2: Inner?;
}

contract Test30 {
    data: Outer?;

    init() {
        self.data = null;
    }
}