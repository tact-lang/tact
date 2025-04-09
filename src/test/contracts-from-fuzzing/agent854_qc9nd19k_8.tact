struct NestedOpt {
    x: Int = 42;
}

struct Container {
    item: NestedOpt? = null;
}

contract TestContract {
    data: Container = Container{};
    init() {}
}
