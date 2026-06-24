struct OptBig {
    comment: String?;
    addr: Address?;
    number: Int;
}

contract TestContract {
    data: OptBig;

    init() {
        self.data = OptBig{
            comment: null,
            addr: null,
            number: 77
        };
    }
}
