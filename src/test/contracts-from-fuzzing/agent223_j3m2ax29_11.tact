struct Inner {
    a: Int?;
    b: Bool?
}

struct Outer {
    in1: Inner?;
    in2: Inner?;
}

contract ManyOptionalStructs {
    data: Outer;

    init() {
        self.data = Outer{
            in1: null,
            in2: null
        };
    }
}