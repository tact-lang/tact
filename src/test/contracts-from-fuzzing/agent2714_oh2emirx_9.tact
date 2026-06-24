struct Optionals {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Address?;
}

contract Test9 {
    optField: Optionals;

    init() {
        self.optField = Optionals{
            one: null,
            two: null,
            three: null,
            four: null
        };
    }
}