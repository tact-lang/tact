struct Packed {
    intVal: Int;
    boolVal: Bool;
    optVal: Int?;
    strVal: String;
}

contract PackedFields {
    data: Packed;

    init() {
        self.data = Packed{
            intVal: 5,
            boolVal: false,
            optVal: null,
            strVal: "packed"
        };
    }
}