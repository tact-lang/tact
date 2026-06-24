struct InnerNoDefault {
    a: Int;
    b: Bool;
}

contract NestedNoDefaults {
    data: InnerNoDefault = InnerNoDefault{ a: 1, b: true };
}