struct DeepOptional {
    x: Int?;
}

struct Mid {
    d1: DeepOptional;
    d2: DeepOptional;
}

contract TestContract {
    d: Mid;

    init() {
        self.d = Mid{
            d1: DeepOptional{x: null},
            d2: DeepOptional{x: 5}
        };
    }
}