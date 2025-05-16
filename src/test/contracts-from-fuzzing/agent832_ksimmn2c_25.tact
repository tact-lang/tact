contract NullToStruct {
    data: TupleField?;

    init() {
        self.data = null;
    }
}

struct TupleField {
    x: Int;
    y: Bool;
    z: String;
}