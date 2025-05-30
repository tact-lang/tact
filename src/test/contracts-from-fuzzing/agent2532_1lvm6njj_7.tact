struct OptionalStringStruct {
    strOpt: String?;
}

contract OptionalStringContract {
    data: OptionalStringStruct;

    init() {
        self.data = OptionalStringStruct{
            strOpt: "hello"
        };
    }
}
