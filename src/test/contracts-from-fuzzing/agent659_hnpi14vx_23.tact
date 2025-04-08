struct Inner {
    val: Int?;
}

struct Outer {
    innerField: Inner?;
}

contract TestContract {
    container: Outer?;

    init() {
        self.container = null;
    }
}