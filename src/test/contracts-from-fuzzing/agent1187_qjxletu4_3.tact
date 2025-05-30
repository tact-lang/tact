struct Inner {
    a: Int;
}

struct Outer {
    val: Inner?; // optional nested struct
}

contract OptionalNested {
    data: Outer = Outer{ val: null };

    init() {
        self.data = Outer{ val: Inner{ a: 123 } };
    }
}