struct BoolAndOptional {
    flag: Bool;
    optInt: Int?;
}

contract BoolOptContract {
    bo: BoolAndOptional;

    init() {
        self.bo = BoolAndOptional{
            flag: true,
            optInt: null,
        };
    }
}