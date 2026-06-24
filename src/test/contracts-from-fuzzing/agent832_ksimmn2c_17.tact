contract NestedTuple {
    a: Int;
    b: Bool;
    c: TupleField;

    init() {
        self.a = 1;
        self.b = true;
        self.c = TupleField{
            x: 5,
            y: false,
            z: "hi",
        };
    }
}

struct TupleField {
    x: Int;
    y: Bool;
    z: String;
}