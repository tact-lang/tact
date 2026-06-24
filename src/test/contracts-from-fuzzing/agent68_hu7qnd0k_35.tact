struct OptPrimStruct {
    a: Int?; 
    b: Bool?;
    c: String?;
    d: Address?;
}

contract NullOptions {
    stored: OptPrimStruct;

    init() {
        self.stored = OptPrimStruct{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
