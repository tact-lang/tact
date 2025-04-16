struct B {
    y: Int;
}

struct A {
    b: B?;
}

contract NestedOptNoInit {
    x: A?;

    init() {
        // Do not assign to x
    }
}