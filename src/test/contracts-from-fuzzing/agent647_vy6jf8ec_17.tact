struct EmptyStringStruct {
    s: String = "";
}

contract EmptyStringVal {
    es: EmptyStringStruct;

    init() {
        self.es = EmptyStringStruct{ s: "" };
    }
}