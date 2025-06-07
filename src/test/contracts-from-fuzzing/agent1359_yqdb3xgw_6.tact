struct InnerOpt {
    alpha: Int?;
    beta: Bool?;
}

struct OuterOpt {
    one: Int?;
    two: InnerOpt?;
    three: String?;
    four: Address?;
    five: Slice?;
    six: Cell?;
}

contract MixedOptionals {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            one: null,
            two: null,
            three: null,
            four: null,
            five: null,
            six: null,
        };
    }
}