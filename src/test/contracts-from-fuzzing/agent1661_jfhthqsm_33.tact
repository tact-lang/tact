struct Bad {
    m: map<Int, Int>;
}

contract ShouldFail {
    b: Bad;
    init() {
        self.b = Bad{m: emptyMap()};
    }
}