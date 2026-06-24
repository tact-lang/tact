struct ManyBoolStruct {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract ManyBoolFields {
    field: ManyBoolStruct;

    init() {
        self.field = ManyBoolStruct{
            a: true, b: false, c: true, d: false,
            e: true, f: false, g: true, h: false
        };
    }
}