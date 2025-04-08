struct NestedWithOptionals {
    inner: Inner?;
    flag: Bool;
}

struct Inner {
    value: Int;
    text: String;
}

contract TestContract {
    payload: NestedWithOptionals;

    init() {
        self.payload = NestedWithOptionals{
            inner: null,
            flag: false
        };
    }
}