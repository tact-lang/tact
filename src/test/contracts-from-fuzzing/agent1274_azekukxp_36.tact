struct DeepStr {
    s1: String;
    s2: String;
}

contract DeepStringStruct {
    d: DeepStr;

    init() {
        self.d = DeepStr{
            s1: "abc",
            s2: "def"
        };
    }
}