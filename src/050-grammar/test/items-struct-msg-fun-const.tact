struct A {
    x: Int;
    y: Int;
}

const a: A = A { x: 1 };

fun getA(): A {
    return A {
        x: 1,
        y: 2,
    };
}

message B {
    x: Int;
    y: Int;
}

const b: B = B {
    x: 2,
    y: 3,
};

fun getB(): B {
    return B { x: 1, y: 5, };
}
