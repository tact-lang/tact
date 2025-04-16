struct OptionalStruct {
    inner: Inside?;
}

struct Inside {
    x: Int;
    y: Bool;
}

contract StructOptField {
    sfield: OptionalStruct?;

    init() {
        self.sfield = OptionalStruct{ inner: Inside{ x: 91, y: true } };
    }
}