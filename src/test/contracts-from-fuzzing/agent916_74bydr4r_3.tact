struct Data {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
}

contract Test {
    saved: Data;

    init() {
        self.saved = Data{
            intVal: null,
            boolVal: null,
            addrVal: null,
        };
    }
}