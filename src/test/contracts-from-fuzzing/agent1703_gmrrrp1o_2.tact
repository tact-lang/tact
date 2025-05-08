struct OneFieldStruct {
    str: String;
}

contract SingleStructField {
    wrapped: OneFieldStruct;

    init() {
        self.wrapped = OneFieldStruct{ str: "abc" };
    }
}