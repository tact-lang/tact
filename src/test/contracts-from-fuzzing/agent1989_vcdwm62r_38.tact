struct EmptyStringStruct {
    s: String = "";
}

contract EmptyStrings {
    x: EmptyStringStruct;

    init() {
        self.x = EmptyStringStruct{};
    }
}