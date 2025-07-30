struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract Opts {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            x: 5,
            y: null,
        };
    }
}