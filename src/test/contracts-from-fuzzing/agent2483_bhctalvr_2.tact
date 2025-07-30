struct Nested {
    flag: Bool = true;
    count: Int = 5;
}

contract TestContract {
    nestedField: Nested = Nested{};
    init() {}
}