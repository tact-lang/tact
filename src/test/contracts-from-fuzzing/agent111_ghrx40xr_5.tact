struct Nully {
    opt1: Int?;
    opt2: String?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Bool?;
}

contract AllOptional {
    n: Nully;
    init() {
        self.n = Nully{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null
        };
    }
}