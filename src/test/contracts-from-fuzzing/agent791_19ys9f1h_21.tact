struct Inner {
    val: Int;
}

struct Complex {
    a: Inner?;
    b: Inner?;
    c: Inner?;
    d: Inner?;
    e: Inner?;
}

contract TestContract {
    complex: Complex = Complex{
        a: null, b: null, c: null, d: null, e: null
    };
}
