struct ComplexOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract Test {
    co: ComplexOpts?;
    
    init() {
        self.co = ComplexOpts {
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
        };
    }

    receive() {
        return;
    }
}
