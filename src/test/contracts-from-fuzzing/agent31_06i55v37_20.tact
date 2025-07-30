struct NestedMap {
    mapField: map<Int, Int>;
}

struct ComplexStruct {
    a: Int;
    nested: NestedMap = NestedMap { mapField: emptyMap() };
}

contract Test {
    receive() {
        let cs: ComplexStruct = ComplexStruct { a: 10 };
        cs.nested.mapField.set(1, 100);
        dump(cs.nested.mapField.get(1)!!);
    }
}
