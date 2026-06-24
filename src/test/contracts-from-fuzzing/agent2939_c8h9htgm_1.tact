struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    foo: Int = 1;
    bar: Bool = false;
    s: Nested = Nested{a: 5, b: true};
}