struct OptionalInStruct {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptionalArray {
    a: OptionalInStruct;
    b: OptionalInStruct;
    c: OptionalInStruct;

    init() {
        self.a = OptionalInStruct{ val1: null, val2: null, val3: null };
        self.b = OptionalInStruct{ val1: 10, val2: true, val3: "abc" };
        self.c = OptionalInStruct{ val1: -1, val2: false, val3: null };
    }
}