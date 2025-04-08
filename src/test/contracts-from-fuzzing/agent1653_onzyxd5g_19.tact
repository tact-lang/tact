struct Inner {
    x: Int?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    x: Outer = Outer{};
    receive() {
        self.x = Outer{nested: Inner{x: 42}};
    }
}