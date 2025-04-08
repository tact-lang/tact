struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    s: Inner = Inner{
        a: 0,
        b: null
    };
}