struct OptInStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
}

contract OptInPersistence {
    data: OptInStruct;
    init() {
        self.data = OptInStruct{
            a: 1,
            b: null,
            c: true,
            d: null
        };
    }
}