struct EmptyStringStruct {
    text: String;
}

contract EmptyStringTest {
    data: EmptyStringStruct;

    init() {
        self.data = EmptyStringStruct{
            text: "",
        };
    }
}