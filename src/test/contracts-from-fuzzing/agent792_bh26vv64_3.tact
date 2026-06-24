struct Various {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
}

contract TestContract {
    data: Various;

    init() {
        self.data = Various{
            a: 1,
            b: false,
            c: emptyCell(),
            d: null
        };
    }
}