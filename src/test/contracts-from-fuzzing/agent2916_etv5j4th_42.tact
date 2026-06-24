struct ManyOptionalDifferentTypes {
    i: Int?;
    s: String?;
    b: Bool?;
    a: Address?;
}

contract ManyOptionalDifferentTypesContract {
    data: ManyOptionalDifferentTypes;

    init() {
        self.data = ManyOptionalDifferentTypes{
            i: null,
            s: null,
            b: null,
            a: null,
        };
    }
}