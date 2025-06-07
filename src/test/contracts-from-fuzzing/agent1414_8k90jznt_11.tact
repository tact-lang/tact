struct OptionalBag {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: Bool?;
    f5: Address?;
    f6: String?;
    f7: Cell?;
    f8: Slice?;
    f9: String?;
    f10: Address?;
}

contract ManyOptionals {
    bag: OptionalBag;

    init() {
        self.bag = OptionalBag {
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: null,
            f10: null
        };
    }
}