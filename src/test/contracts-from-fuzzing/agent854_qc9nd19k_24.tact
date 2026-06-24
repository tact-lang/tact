message Info {
    x: Int = 5;
}

struct Container {
    info: Info? = null;
}

contract TestContract {
    storage: Container = Container{};
    init() {}
}
