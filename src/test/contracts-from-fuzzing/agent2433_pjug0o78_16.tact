contract OptionalStructs {
    data: InnerStruct?;

    init() {
        self.data = null;
    }
}

struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}