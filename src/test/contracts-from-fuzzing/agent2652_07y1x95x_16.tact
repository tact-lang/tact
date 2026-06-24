struct EmptyStringStruct {
    text: String;
}

contract EmptyStringTest {
    s: EmptyStringStruct;

    init() {
        self.s = EmptyStringStruct{ text: "" };
    }
}