struct Nested {
    a: Int;
    b: Int;
}

contract TestContract {
    nestedOptField: Nested?;
    receive() {}
}