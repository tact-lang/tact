struct HasEmptyString {
    name: String = "";
}

contract EmptyStringInStruct {
    st: HasEmptyString;

    init() {
        self.st = HasEmptyString{};
    }
}