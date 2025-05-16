struct OptStruct {
    s: String?;
    x: Int?;
    a: Bool?;
}

contract Test4 {
    stuff: OptStruct;
    init() {
        self.stuff = OptStruct{
            s: null,
            x: 123,
            a: true,
        };
    }
}