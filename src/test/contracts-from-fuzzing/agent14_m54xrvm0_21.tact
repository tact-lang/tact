struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    nested: Inner?;
}

contract Test21 {
    data: Outer;

    init() {
        self.data = Outer{ nested: null };
    }
}
