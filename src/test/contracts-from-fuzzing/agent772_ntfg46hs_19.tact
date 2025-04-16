struct LongStringStruct {
    text1: String;
    text2: String;
    text3: String;
    text4: String;
    text5: String;
}

contract TestContract {
    data: LongStringStruct;

    init() {
        self.data = LongStringStruct{
            text1: "one",
            text2: "two",
            text3: "three",
            text4: "four",
            text5: "five",
        };
    }
}