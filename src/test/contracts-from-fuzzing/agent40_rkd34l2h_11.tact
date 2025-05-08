struct NestedOpt {
    Field: Int;
}

struct ComplexStruct {
    OptField: NestedOpt?;
    Mapping: map<Int, NestedOpt>;
}

contract TestComplexStruct {
    receive() {
        let cs = ComplexStruct { OptField: null, Mapping: emptyMap() };
    }
}
