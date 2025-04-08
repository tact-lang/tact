struct WithDefaults {
    x: Int = 42;
    y: Bool = true;
}

struct Container {
    inner: WithDefaults;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{ inner: WithDefaults{} };
    }
}