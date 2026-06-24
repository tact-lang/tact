struct Complex {
    a: Int;
    b: Bool;
    s: String;
}

contract ComplexDefaults {
    c: Complex = Complex{a: 1, b: false, s: "hello"};
}