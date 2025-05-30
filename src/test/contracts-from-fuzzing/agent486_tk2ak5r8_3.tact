struct OptionNest {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Slice?;
    opt6: Builder?;
    opt7: String?;
}

contract TestOptionNest {
    on: OptionNest;

    init() {
        self.on = OptionNest{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
            opt7: null
        };
    }
}