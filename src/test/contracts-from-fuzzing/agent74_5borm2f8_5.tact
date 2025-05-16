struct OptionalNestedLvl2 {
    x: Int?;
    y: String?;
}

struct OptionalNestedLvl1 {
    inner: OptionalNestedLvl2?;
}

contract OptionalDeepStruct {
    storage: OptionalNestedLvl1;

    init() {
        self.storage = OptionalNestedLvl1{
            inner: OptionalNestedLvl2 {
                x: 123,
                y: null,
            }
        };
    }
}