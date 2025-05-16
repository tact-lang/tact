struct A {
    a: Int;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract TestContract {
    data: A;
    init() {
        self.data = A{
            a: 1,
            b: null,
            c: null,
            d: null
        };
    }
}