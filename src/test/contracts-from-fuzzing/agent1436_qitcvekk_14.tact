struct BoolVariants {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

contract TestContract {
    bools: BoolVariants;

    init() {
        self.bools = BoolVariants{
            b1: true,
            b2: null,
            b3: false,
            b4: true
        };
    }
}