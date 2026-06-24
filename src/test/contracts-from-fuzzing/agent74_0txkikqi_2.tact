struct Nested {
    innerOpt: Int?;
    innerMap: map<Int, Int>;
}

contract Test {
    param: Nested;

    init() {
        self.param = Nested{ innerOpt: null, innerMap: emptyMap() };
    }
}