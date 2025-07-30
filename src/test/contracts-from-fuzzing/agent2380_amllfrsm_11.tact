// nested optional struct with default null, inner has optional field too
struct Inner {
    foo: Int?;
}

contract TestContract {
    outer: Inner?;
    init() {
        self.outer = null;
    }
}