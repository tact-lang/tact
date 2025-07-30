struct Inner {
    flag: Bool;
    note: String;
}

struct Outer {
    val: Int;
    inner: Inner;
}

contract DeepNestedStorage {
    data: Outer;

    init() {
        self.data = Outer{val: 7, inner: Inner{flag: true, note: "hi"}};
    }
}