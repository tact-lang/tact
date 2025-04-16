struct NestedNullable {
    val: Int?;
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    number: Int?;
}

contract TestContract {
    s: NestedNullable;
    init() {
        self.s = NestedNullable{ val: null, inner: null };
    }
}