struct Nested {
    opt: Int?;
    str: String;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{opt: null, str: "abc"};
    }
}
