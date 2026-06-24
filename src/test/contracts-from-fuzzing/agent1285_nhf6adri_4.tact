struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    optField: OptStruct;
    init() {
        self.optField = OptStruct{
            a: null,
            b: true,
            c: null
        };
    }
}