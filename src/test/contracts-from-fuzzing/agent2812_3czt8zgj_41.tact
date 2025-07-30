struct BoolAndOptional {
    flag: Bool;
    opt: Bool?;
}

contract BoolOpt {
    data: BoolAndOptional;

    init() {
        self.data = BoolAndOptional{
            flag: true,
            opt: null
        };
    }
}