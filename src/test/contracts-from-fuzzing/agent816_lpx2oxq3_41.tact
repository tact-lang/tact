struct InsidePacked {
    i: Int;
    s: String;
    f: Bool;
}

contract StructInsidePackedTest {
    st: InsidePacked;

    init() {
        self.st = InsidePacked{ i: 1, s: "x", f:true };
    }
}
