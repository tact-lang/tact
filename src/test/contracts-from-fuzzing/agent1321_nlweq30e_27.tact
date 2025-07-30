// Persistent field with optional struct with multiple optionals inside
struct ComplexOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Top {
    foo: ComplexOpt?;

    init() {
        self.foo = ComplexOpt{ a:1, b:null, c:true };
    }
}
