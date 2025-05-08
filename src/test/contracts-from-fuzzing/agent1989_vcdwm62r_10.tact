struct LargeOptional {
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    opt4: Address?;
}

contract LargeOptionalVars {
    data: LargeOptional;

    init() {
        self.data = LargeOptional{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
        };
    }
}