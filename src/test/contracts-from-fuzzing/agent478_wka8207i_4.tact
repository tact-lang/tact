struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner?;  // optional nested struct
}

contract TestContract {
    state: Outer = Outer{nested: null};

    init() {
        self.state = Outer{nested: Inner{val: 99}};
    }
}
