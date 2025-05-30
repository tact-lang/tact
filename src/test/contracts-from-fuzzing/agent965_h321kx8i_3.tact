struct S1 {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    data: S1;

    init() {
        self.data = S1{
            a: null,
            b: null,
            c: null,
        };
    }
}