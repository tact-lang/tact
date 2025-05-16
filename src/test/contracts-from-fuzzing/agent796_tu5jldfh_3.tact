struct OptInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    info: OptInStruct;

    init() {
        self.info = OptInStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}