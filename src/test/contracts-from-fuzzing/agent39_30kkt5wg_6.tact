struct ComplexStruct {
    OptField: Int?;
    PairMap: map<Int, Int>;
}

contract TestComplex {
    receive() {
        // Instantiate with an optional field and an empty map
        let cs: ComplexStruct = ComplexStruct { OptField: 42, PairMap: emptyMap() };
        if (cs.OptField != null) {
            dump(cs.OptField!!);
        }
    }
}
