struct NestedNullableFinal {
    field: StructFinal?;
}

struct StructFinal {
    a: Int;
    b: Bool;
    c: String;
}

contract LayeredNullable {
    nv: NestedNullableFinal;

    init() {
        self.nv = NestedNullableFinal { field: null };
    }
}