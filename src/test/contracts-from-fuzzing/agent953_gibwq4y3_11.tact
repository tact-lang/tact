struct Inner {
    value: Int = 11;
}

struct Container {
    inner: Inner?;
}

contract Test {
    x: Container = Container{};
}