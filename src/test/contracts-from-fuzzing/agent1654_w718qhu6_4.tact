struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: true,
            c: null
        };
    }
}