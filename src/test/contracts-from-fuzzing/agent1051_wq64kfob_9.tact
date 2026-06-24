struct OptionalStruct {
    s: String?;
    b: Bool?;
    i: Int?;
    a: Address?;
    c: Cell?;
}

contract ManyOptionals {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{
            s: null,
            b: null,
            i: null,
            a: null,
            c: null
        };
    }
}