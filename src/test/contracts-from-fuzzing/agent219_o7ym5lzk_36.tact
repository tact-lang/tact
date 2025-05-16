struct PrimWrap {
    i: Int;
    b: Bool;
    s: String;
}

contract PrimWrapTest {
    wrap: PrimWrap;

    init() {
        self.wrap = PrimWrap{ i: 42, b: true, s: "X" };
    }
}