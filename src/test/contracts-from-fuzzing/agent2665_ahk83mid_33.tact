struct InnerOne {
    val: Int = 1;
}

struct InnerTwo {
    val: Int = 2;
}

struct Container {
    a: InnerOne = InnerOne{};
    b: InnerTwo = InnerTwo{};
}

contract DoubleNestedDefaults {
    data: Container = Container{};
}