struct DeepNest {
    opt1: Int?;
    nested1: Nested;
}

struct Inner {
    u: Int;
    flag: Bool;
}

struct Nested {
    val: Int?;
    inner: Inner;
}

contract TestContract {
    state: DeepNest;

    init() {
        self.state = DeepNest{opt1: null, nested1: Nested{val: 5, inner: Inner{u:7, flag:true}}};
    }
}
