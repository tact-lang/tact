struct StrStruct {
    s1: String;
    s2: String;
}

contract StringsInStruct {
    data: StrStruct;
    n: Int;

    init() {
        self.data = StrStruct { s1:"hello", s2:"world" };
        self.n = 123;
    }
}