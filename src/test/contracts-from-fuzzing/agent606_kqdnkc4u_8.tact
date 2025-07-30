struct Inner {
    foo: Int = 42;
}

struct Container {
    nested: Inner?;
}

contract Test {
    data: Container = Container{ nested: Inner{} };
}