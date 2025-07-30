struct DeepOptionalS {
    a: Int?;
    b: String;
    c: Bool?;
}

contract ManyOptStruct {
    s: DeepOptionalS?;
    init() {
        self.s = null;
    }
}