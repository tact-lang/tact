struct S {
    a: Int = 5;
    b: Bool?;
}

contract OptionalNotSet {
    s: S = S{
        b: null
    };
}