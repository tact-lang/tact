struct Inner {
    foo: Int?;
}

struct Outer {
    a: String?;
    b: Bool?;
    c: Inner?;
}

contract Test8 {
    data: Outer;

    init() {
        self.data = Outer{
            a: null,
            b: null,
            c: null,
        };
    }
}