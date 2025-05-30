struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
}

contract MixPrimitiveOptional {
    data: S;
    init() {
        self.data = S{ a:1, b:true, c:null, d:null, e:"x" };
    }
}