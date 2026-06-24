struct EdgeOptionalStruct {
    required: Int;
    opt1: Int?;
}

contract EdgeOptionalTest {
    data: EdgeOptionalStruct;

    init() {
        self.data = EdgeOptionalStruct{
            required: 123,
            opt1: null
        };
    }
}
