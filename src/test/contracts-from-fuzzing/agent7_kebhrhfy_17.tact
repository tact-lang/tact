struct Inner {
    x: Int?;
}

struct Outer {
    a: Inner?;
    b: Inner?;
}

contract MultiOptionalStructs {
    obj: Outer;
    init() {
        self.obj = Outer{
            a: null,
            b: null
        };
    }
}