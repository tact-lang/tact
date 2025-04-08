struct BigNestedOptional {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Cell?;
    opt5: Address?;
}

contract ManyOptionals {
    state: BigNestedOptional;

    init() {
        self.state = BigNestedOptional{
            opt1: null,
            opt2: null,
            opt3: true,
            opt4: null,
            opt5: null
        };
    }
}