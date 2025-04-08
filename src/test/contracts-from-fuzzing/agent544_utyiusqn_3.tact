struct A {
    b: Int?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: String?;
}

contract TestContract {
    a: A;

    init() {
        self.a = A{
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}