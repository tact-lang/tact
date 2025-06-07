struct OptionalStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            x: null,
            y: true,
            s: null,
        };
    }
}