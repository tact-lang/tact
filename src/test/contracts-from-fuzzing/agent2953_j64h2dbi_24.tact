struct Siblings {
    left: Int;
    right: Int?;
    mid: Bool;
}

contract ContractSiblings {
    data: Siblings;

    init() {
        self.data = Siblings{
            left: 10,
            right: null,
            mid: false,
        };
    }
}