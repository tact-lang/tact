struct LongStringStruct {
    longData: String;
}

contract LongStringField {
    info: LongStringStruct;

    init() {
        self.info = LongStringStruct{
            longData: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        };
    }
}