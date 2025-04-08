struct PrimStruct {
    i: Int;
    b: Bool;
    s: String;
}

contract NestedOptionalsTest {
    opt1: PrimStruct?;
    opt2: PrimStruct?;

    init() {
        self.opt1 = null;
        self.opt2 = PrimStruct{
            i: 123,
            b: false,
            s: "hello",
        };
    }
}
