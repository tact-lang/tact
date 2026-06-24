// unusual: swap order of optional and regular fields
struct WeirdOrder {
    optA: Int?;
    regB: Int;
    optC: Bool?;
    regD: Bool;
}

contract OrderContract {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            optA: null,
            regB: 1,
            optC: null,
            regD: false,
        };
    }
}