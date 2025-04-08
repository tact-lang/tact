struct HasManyOpts {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
    opt5: Slice?;
}

contract TestContract {
    data: HasManyOpts;

    init() {
        self.data = HasManyOpts {
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null
        };
    }
}