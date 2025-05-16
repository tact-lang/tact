struct BadField {
    x: map<Int, Int>;
}

contract ShouldFail {
    s: BadField;
    init() {
        self.s = BadField{ x: emptyMap() };
    }
}