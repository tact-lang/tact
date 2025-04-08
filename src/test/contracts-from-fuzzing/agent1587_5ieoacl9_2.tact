struct ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
    opt4: Address?;
    opt5: String?;
    opt6: Slice?;
}

contract OptionalStorage {
    mo: ManyOptionals;

    init() {
        self.mo = ManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
        };
    }
}