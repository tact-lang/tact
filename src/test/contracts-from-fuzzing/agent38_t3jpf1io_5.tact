struct DefaultValsStruct {
    a: Int = 42;
    b: Bool = false;
    c: Int?; // implicitly null
    d: Bool?; // implicitly null
}

contract DefaultsContract {
    data: DefaultValsStruct;

    init() {
        self.data = DefaultValsStruct{
            // no fields specified, rely on defaults
        };
    }
}