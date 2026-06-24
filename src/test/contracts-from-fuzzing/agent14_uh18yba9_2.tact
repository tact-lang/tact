struct Inner {
    n1: Int?;
    n2: Bool?;
    n3: String?;
}

struct Outer {
    in1: Inner?;
    in2: Int?;
    in3: Bool?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            in1: null,
            in2: null,
            in3: null,
        };
    }
}