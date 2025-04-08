struct DeeplyOptioned {
    opt1: Int?;
    opt2: Int?;
    opt3: Int?;
    opt4: Int?;
    opt5: Int?;
}

contract TestContract {
    s: DeeplyOptioned;

    init() {
        self.s = DeeplyOptioned{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: 999,
        };
    }
}
