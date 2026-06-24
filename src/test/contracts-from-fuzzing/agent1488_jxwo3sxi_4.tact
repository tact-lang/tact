struct ManyOptionals {
    one: Int?;
    two: String?;
    three: Bool?;
    four: Address?;
    five: Cell?;
    six: Slice?;
    seven: Builder?;
}

contract ManyNulls {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            one: null,
            two: null,
            three: null,
            four: null,
            five: null,
            six: null,
            seven: null,
        };
    }
}