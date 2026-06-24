struct OptionalWithDefaults {
    a: Int? = null;
    b: Int = 5;
    c: Int?;
}

contract OptDefaultsStruct {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{
            c: null
        };
    }
}