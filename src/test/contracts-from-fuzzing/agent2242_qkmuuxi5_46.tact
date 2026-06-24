struct InnerOptStruct {
    a: Int?;
}

struct OuterOptStruct {
    inside: InnerOptStruct?;
}

contract OptionalStructField {
    field: OuterOptStruct;

    init() {
        self.field = OuterOptStruct{ inside: null };
    }
}