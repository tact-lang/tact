struct Params {
    p1: Int;
    p2: Bool;
    p3: String;
    p4: Address;
    p5: Slice;
}

contract ParamFieldTest {
    values: Params;

    init() {
        self.values = Params{
            p1: 7,
            p2: false,
            p3: "world",
            p4: myAddress(),
            p5: emptyCell().asSlice()
        };
    }
}