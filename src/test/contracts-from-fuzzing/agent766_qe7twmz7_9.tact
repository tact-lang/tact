struct OptionsOnly {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
}

struct OuterWrap {
    options: OptionsOnly?;
    label: String = "default";
}

contract OptionalMegaTest {
    optOuter: OuterWrap? = null;
    init() {
        self.optOuter = OuterWrap{
            options: OptionsOnly{ o1: 100, o2: true, o3: "hello", o4: myAddress(), o5: emptyCell() },
            label: "set"
        };
    }
}