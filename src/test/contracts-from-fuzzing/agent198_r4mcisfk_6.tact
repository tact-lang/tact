struct BigOptional {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Cell?;
    opt5: Address?;
}

contract TestManyOptionals {
    optStruct: BigOptional;

    init() {
        self.optStruct = BigOptional{
            opt1: 1,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null
        };
    }
}
