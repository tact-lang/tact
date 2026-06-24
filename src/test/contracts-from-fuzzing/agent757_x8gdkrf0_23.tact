struct Nested {
    foo: Int = 7;
    bar: String = "ok";
}

contract TestContract(
    settings: Nested,
    counter: Int,
) {}