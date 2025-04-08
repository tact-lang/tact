struct BoolVariants {
    b1: Bool;
    b2: Bool?;
}

contract BoolContract {
    flags: BoolVariants;

    init() {
        self.flags = BoolVariants{ b1: true, b2: false };
    }
}