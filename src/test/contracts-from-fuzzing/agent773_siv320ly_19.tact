struct OptionLoop {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
}

contract ManyOptionals {
    data: OptionLoop;

    init() {
        self.data = OptionLoop{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
        };
    }
}