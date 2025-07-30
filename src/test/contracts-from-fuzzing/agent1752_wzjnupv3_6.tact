struct Complex {
    a: Int?; 
    b: Bool?; 
    c: String?; 
}

contract ComplexDefaults {
    foo: Complex = Complex{ b: true };
}