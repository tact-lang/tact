struct Inner {
    val: Int;
}

struct Outer {
    a: Inner?;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = null;
    }
}