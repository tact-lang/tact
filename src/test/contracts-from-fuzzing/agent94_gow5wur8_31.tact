struct Sub {
    a: Int?;
    b: Int?;
}

contract Test {
    nestedOpt: Sub?;

    init() {
        self.nestedOpt = Sub{
            a: null,
            b: null,
        };
    }
}