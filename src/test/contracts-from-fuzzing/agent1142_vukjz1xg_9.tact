struct S {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract NullShared {
    data: S;

    init() {
        self.data = S { a:null, b:null, c:null, d:null };
    }
}