struct BigOptional {
    first: Int?;
    second: Bool?;
    third: Int?;
    fourth: Bool?;
}

contract TestBigOptional {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            first: null,
            second: null,
            third: null,
            fourth: null,
        };
    }
}