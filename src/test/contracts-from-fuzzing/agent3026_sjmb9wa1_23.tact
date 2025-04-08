struct OptNested {
    val: Inner?;
}

struct Inner {
    a: Int;
    b: Cell?;
    c: String?;
}

contract Holder {
    data: OptNested;
    init() {
        self.data = OptNested{ val: null };
    }
}