struct Nested {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    data: Nested = Nested{};
    init() {}
}