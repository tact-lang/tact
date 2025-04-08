struct Mixed {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    addrVal: Address;
    sliced: Slice;
    celled: Cell;
    intOpt: Int?;
    strOpt: String?;
    nested: NestedMix;
}

struct NestedMix {
    foo: Bool;
    bar: Int;
    baz: String;
}

contract MixedTypes {
    data: Mixed;

    init() {
        self.data = Mixed{
            intVal: 0,
            strVal: "",
            boolVal: false,
            addrVal: myAddress(),
            sliced: emptyCell().asSlice(),
            celled: emptyCell(),
            intOpt: null,
            strOpt: null,
            nested: NestedMix{foo:false, bar:0, baz:""}
        };
    }
}
