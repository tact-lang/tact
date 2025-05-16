struct InnerDefaults {
    x: Int = 10;
    y: Bool = true;
}
struct OuterDefaults2 {
    inner: InnerDefaults = InnerDefaults{};
    msg: String = "hi";
}

contract NestedStructsExplicitDefaults {
    s: OuterDefaults2 = OuterDefaults2{};

    init() {}
}