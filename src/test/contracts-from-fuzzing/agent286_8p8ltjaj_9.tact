struct OptNested {
    level2: Int?;
    level3: Int?;
}

struct Container {
    nestedOpt: OptNested?;
    val: Int;
}

contract TestContract {
    store: Container;

    init() {
        self.store = Container{
            nestedOpt: null,
            val: 42
        };
    }
}