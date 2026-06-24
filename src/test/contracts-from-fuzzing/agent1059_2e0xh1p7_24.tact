struct Inner {
    opt: Int?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{nested: null};
    }
}