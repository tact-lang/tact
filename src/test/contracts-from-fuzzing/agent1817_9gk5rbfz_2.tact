struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: String?;
    opt7: Int?;
    opt8: Bool?;
    opt9: String?;
    opt10: Slice?;
}

contract ManyOptionalFields {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
            opt7: null,
            opt8: null,
            opt9: null,
            opt10: null,
        };
    }
}
