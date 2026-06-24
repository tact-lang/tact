// optional of nested struct inside optional outer struct
struct Inner {
    value: Bool;
}

struct Outer {
    inner: Inner?;
    number: Int;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }
}
