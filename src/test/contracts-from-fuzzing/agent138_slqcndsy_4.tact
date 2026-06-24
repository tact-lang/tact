struct Params {
    name: String = "abc";
    age: Int?;
    flag: Bool = true;
}

contract Test {
    p: Params;
    init() {
        self.p = Params{ };
    }
}