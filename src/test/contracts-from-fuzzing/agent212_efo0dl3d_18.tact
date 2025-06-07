struct Bar {
    v: Int;
}

struct Foo {
    b: Bar;
    optB: Bar?;
}

contract TestContract(
    param1: Int,
    param2: Foo,
    param3: Foo?
) {}