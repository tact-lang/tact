struct DeepStruct {
    x: Int;
    y: String;
    z: Bool;
}

struct MidStruct {
    a: Bool;
    s: DeepStruct;
}

contract NestedOptionals {
    field: MidStruct?;

    init() {
        self.field = null;
    }
}