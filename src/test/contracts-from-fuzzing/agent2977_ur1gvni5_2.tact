struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner;
}

contract NestedStructField {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{ val: 1 } };
    }
}