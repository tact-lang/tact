struct C {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MixedOptDefaults {
    v: C = C{ a:null, b:null, c:null };
}