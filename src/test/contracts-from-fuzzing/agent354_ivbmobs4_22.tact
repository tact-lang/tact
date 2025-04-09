struct Complex {
    a: Int = 1;
    b: String = "X";
    c: Int?;
    d: Bool?;
    e: InnerStruct?;
    f: Bool = true;
    g: InnerStruct = InnerStruct{x:5};
}

struct InnerStruct {
    x: Int;
}

contract ComplexDefaults {
    val: Complex = Complex{};
}