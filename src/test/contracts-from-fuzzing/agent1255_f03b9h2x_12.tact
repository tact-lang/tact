struct S {
    a: Bool = false;
    b: Int?;
    c: String = "default";
    d: String?;
}

contract Test12 {
    data: S;

    init() {
        self.data = S{
            b: null,
            d: null,
        };
    }
}