struct BooleanVariants {
    truthy: Bool;
    falsy: Bool;
    opt: Bool?;
}

contract BoolVariantsContract {
    f: BooleanVariants;

    init() {
        self.f = BooleanVariants{
            truthy: true,
            falsy: false,
            opt: null,
        };
    }
}