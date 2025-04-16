struct LongStringStruct {
    longText: String;
}

contract LongStringFieldTest {
    data: LongStringStruct;

    init() {
        self.data = LongStringStruct{
            longText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        };
    }
}