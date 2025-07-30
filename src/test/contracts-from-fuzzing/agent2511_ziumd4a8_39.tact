struct OptInStruct {
    a: Int?;
    b: Int?;
    c: String?;
}

contract MultOptInner {
    data: OptInStruct;

    init() {
        self.data = OptInStruct{
            a: null,
            b: 9,
            c: null
        };
    }
}