struct S {
    a: Int; 
    b: String?;
    c: Bool?;
    d: String = "default"; 
}

contract Test {
    field: S;
    init() {
        self.field = S{ a: 1, b: null, c: null, d: "default" };
    }
}