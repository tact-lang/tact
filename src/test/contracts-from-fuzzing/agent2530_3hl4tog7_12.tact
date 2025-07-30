struct OptFieldStruct {
    a: Int = 10;
    b: Bool;
    c: String?;
}

contract MixedDefaults {
    store: OptFieldStruct;

    init() {
        self.store = OptFieldStruct{
            b: true,
            c: null
        };
    }
}