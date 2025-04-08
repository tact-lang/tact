struct Inner {
    a: Int = 1;
    b: Int?;
}

struct Outer {
    inner: Inner;    
    label: String = "x";
}

contract DoubleNest {
    field: Outer = Outer{ inner: Inner{} };
}