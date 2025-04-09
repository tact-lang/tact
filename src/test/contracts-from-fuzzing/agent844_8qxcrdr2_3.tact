struct OptionalDeepNested {
    innerOpt: Int?;
    strOpt: String?;
}

struct ParentOptional {
    nestedOpt: OptionalDeepNested?;
    countOpt: Int?;
    flagOpt: Bool?;
}

contract OptionalTest {
    item: ParentOptional;

    init() {
        self.item = ParentOptional{
            nestedOpt: null,
            countOpt: null,
            flagOpt: null,
        };
    }

    receive() {
        let _ = self.item;
    }
}
