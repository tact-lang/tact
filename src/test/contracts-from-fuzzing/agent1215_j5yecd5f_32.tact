struct A {
    foo: Int;
    bar: Bool;
}

struct B {
    foo: A;
    bar: A?;
}

struct C {
    foo: B;
    bar: B?;
}

contract MultipleNestedOptional(
    val: C?,
) {}