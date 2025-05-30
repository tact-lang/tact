struct Nested {
    a: Int = 5;
    b: Int? = null;
}

contract TestContract {
    nestedField: Nested = Nested{};
    receive() {}
}