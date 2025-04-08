struct BigOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
    maybeCell: Cell?;
    maybeAddr: Address?;
}

contract BigOptContract {
    data: BigOptional;

    init() {
        self.data = BigOptional{
            maybeInt: 123,
            maybeBool: false,
            maybeStr: null,
            maybeCell: null,
            maybeAddr: null
        };
    }
}