struct S {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}
