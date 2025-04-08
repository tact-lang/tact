struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell?;
}

contract MixedTypes {
    val: Complex = Complex{
        i: 1,
        b: true,
        s: "hi",
        c: null,
    };
}