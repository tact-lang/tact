struct MixedOptional {
    req: Int;
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: Cell?;
}

contract TestContract {
    storage: MixedOptional;

    init() {
        self.storage = MixedOptional{
            req: 1,
            opt1: null,
            opt2: true,
            opt3: null,
            opt4: null
        };
    }
}
