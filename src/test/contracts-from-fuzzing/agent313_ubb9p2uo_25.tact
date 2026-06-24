struct FixedOrder {
    first: Int;
    second: String;
    third: Bool;
}

contract OrderStorage {
    dat: FixedOrder;

    init() {
        self.dat = FixedOrder{
            third: true,
            first: 999,
            second: "ordered"
        };
    }
}