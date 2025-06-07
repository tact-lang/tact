struct StrStruct {
    s1: String;
    s2: String;
}

contract Test {
    val: StrStruct;
    init() {
        self.val = StrStruct{ s1: "Hello", s2: "World" };
    }
}
