struct ManyOptionals {
    opt1: Int?;
    opt2: Int?;
    opt3: Bool?;
    opt4: String?;
    opt5: Cell?;
}

contract OptionalFields {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            opt1: null,
            opt2: 10,
            opt3: false,
            opt4: null,
            opt5: null
        };
    }
}