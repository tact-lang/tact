struct A {
    nestedOpt: B?;
}

struct B {
    x: Int;
}

contract OptionalNestedStructContract {
    val: A = A{ nestedOpt: null };
}