struct STest {
    v1: Int;
    v2: String;
}

contract ArrayLikeStructs {
    d1: STest;
    d2: STest;
    d3: STest;

    init() {
        self.d1 = STest{ v1:1, v2:"a" };
        self.d2 = STest{ v1:2, v2:"b" };
        self.d3 = STest{ v1:3, v2:"c" };
    }
}