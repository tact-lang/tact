struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    a: Int;
    b: Bool;
    strct: OptionalStruct;

    init() {
        self.a = 1;
        self.b = false;
        self.strct = OptionalStruct{
            x: null,
            y: null,
            z: null,
        };
    }
}