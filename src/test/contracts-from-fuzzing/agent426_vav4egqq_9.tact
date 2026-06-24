struct OptionalDeep {
    one: Int?;
    two: Bool?;
    three: Address?;
    nested: OptionalStruct?;
}

struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            one: null,
            two: null,
            three: null,
            nested: null,
        };
    }
}