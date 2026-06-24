struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

contract ManyNullableFields {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
        };
    }
}