struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Int?;
    opt4: Bool?;
    opt5: Int?;
}

contract ManyOptionalFields {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            opt1: null,
            opt2: true,
            opt3: 3,
            opt4: null,
            opt5: 5
        };
    }
}
