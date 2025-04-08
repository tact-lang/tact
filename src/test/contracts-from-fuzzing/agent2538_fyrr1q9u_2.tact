struct OptionalNest {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

contract PersistOptionalStruct {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            inner1: null,
            inner2: true,
            inner3: null
        };
    }
}