struct NestedOptional {
    value: Int?;
}

struct Container {
    nested: NestedOptional?;
}

contract TestContract {
    data: Container = Container{};
    flag: Bool = true;
}