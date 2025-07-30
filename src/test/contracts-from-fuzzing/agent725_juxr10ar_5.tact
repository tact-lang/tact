struct Composite {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract ComplexFields {
    storage: Composite;

    init() {
        self.storage = Composite{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            maybeInt: null,
            maybeBool: false
        };
    }
}