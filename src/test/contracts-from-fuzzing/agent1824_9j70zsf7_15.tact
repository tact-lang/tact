struct Inner {
    x: Int?;
}

struct Outer {
    a: Inner?;
    b: Inner?;
}

contract NullableStructFields {
    data: Outer;

    init() {
        self.data = Outer{a: null, b: null};
    }
}
