struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
}

contract C {
    f: Complex = Complex{ a:1, b:true, c:"hi", d:null, e:null, f:"bye" };
}
