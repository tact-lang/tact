struct AltOrder {
    z: String;
    y: Bool;
    x: Int;
}

contract FieldOrdering {
    fields: AltOrder;

    init() {
        self.fields = AltOrder{
            z: "abc",
            y: false,
            x: 42,
        };
    }
}