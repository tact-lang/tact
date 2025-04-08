struct OptNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptNestedStore {
    data: OptNested;

    init() {
        self.data = OptNested{ inner: null };
    }
}