struct Inner {
    x: Int;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    composite: Outer? = null;
    receive() {
        self.composite = Outer{nested: Inner{x: 1}};
    }
}