struct Bag {
    aa: Int?;
    bb: Bool?;
    cc: String?;
    dd: Address?;
    ee: Cell?;
}

contract TestContract {
    bag: Bag;

    init() {
        self.bag = Bag{
            aa: null,
            bb: null,
            cc: null,
            dd: null,
            ee: null,
        };
    }
}