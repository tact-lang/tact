struct InnerX {
    text: String;
    flag: Bool;
}

contract NestedFieldTest {
    x: InnerX;
    optInner: InnerX?;

    init() {
        self.x = InnerX{
            text: "abc",
            flag: false,
        };
        self.optInner = null;
    }
}
