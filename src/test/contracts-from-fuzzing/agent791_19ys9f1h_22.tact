struct Inner {
    val: Int;
}

struct Complex {
    a: Inner?;
    b: Inner?;
    c: Inner?;
}

contract TestContract {
    complex: Complex = Complex{
        a: Inner{ val: 1 },
        b: null,
        c: Inner{ val: 3 }
    };
}
