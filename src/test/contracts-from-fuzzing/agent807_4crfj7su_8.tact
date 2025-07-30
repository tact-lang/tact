struct SerialOpts {
    first: Int?;
    second: Int?;
    third: Int?;
    fourth: Int?;
}

contract SerialOptionalFields {
    data: SerialOpts;
    init() {
        self.data = SerialOpts{
            first: 1,
            second: null,
            third: 3,
            fourth: null,
        };
    }
}