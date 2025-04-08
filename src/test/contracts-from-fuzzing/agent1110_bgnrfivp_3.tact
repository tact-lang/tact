struct OptionalStruct {
    x: Int?;
    y: Bool?;
    msg: String?;
}

contract OptFieldContract {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            x: null,
            y: true,
            msg: "Test",
        };
    }
}