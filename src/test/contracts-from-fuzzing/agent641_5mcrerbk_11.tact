struct DeepOptional {
    innermost: Int?;
}

struct MidOptional {
    nested: DeepOptional?;
}

struct OuterOptional {
    wrapper: MidOptional?;
}

contract TestContract {
    complex: OuterOptional;

    init() {
        self.complex = OuterOptional{
            wrapper: null
        };
    }
}