struct DefaultsAndOpts {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
}

contract Test {
    d: DefaultsAndOpts = DefaultsAndOpts{ b: null };
}