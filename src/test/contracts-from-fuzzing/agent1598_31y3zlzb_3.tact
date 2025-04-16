struct LargeA {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Bool;
    x5: Bool?;
    x6: String;
    x7: String?;
    x8: Int;
    x9: Bool;
    x10: String;
}

contract LargeTest {
    bigfield: LargeA;

    init() {
        self.bigfield = LargeA{
            x1: 1, x2: 2, x3: 3, x4: true, x5: null, x6: "a", x7: null, x8: 8, x9: false, x10: "b"
        };
    }
}