struct S1 {
    val: Int;
}

struct S2 {
    inner: S1;
    text: String;
}

contract NestedMultipleTypes {
    store: S2;

    init() {
        self.store = S2 {
            inner: S1{ val: 120 },
            text: "hey"
        };
    }
}
