contract PersistOptional {
    s: OptionalStruct;
    init() {
        self.s = OptionalStruct{
            x:null,
            y:null
        };
    }
}

struct OptionalStruct {
    x: Int?;
    y: Bool?;
}