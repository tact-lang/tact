struct Nested {
    x: Int = 1;
    y: Bool?;
    z: String = "hi";
}

contract TestContract {
    nested: Nested = Nested{};
    init() {}
}