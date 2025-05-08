struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    val: Int;
}

contract OptionalTest {
    persist: OptionalStruct;

    init() {
        self.persist = OptionalStruct{
            optInt: null,
            optBool: true,
            val: 100,
        };
    }
}