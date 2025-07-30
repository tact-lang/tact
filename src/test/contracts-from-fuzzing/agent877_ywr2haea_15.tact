struct OuterOptional {
    innerNum: Int?;
    innerBool: Bool?;
}

contract OptionalComplex {
    data: OuterOptional?;

    init() {
        self.data = OuterOptional{
            innerNum: null,
            innerBool: true,
        };
    }
}