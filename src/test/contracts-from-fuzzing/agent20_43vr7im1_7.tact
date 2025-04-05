struct NestedField {
    val: Int;
}

struct Complex {
    mapField: map<Int, Int>;
    optional: Int?;
    nested: NestedField;
}

contract TestComplex {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let c: Complex = Complex { 
            mapField: m, 
            optional: 200, 
            nested: NestedField { val: 300 } 
        };
        c.nested.val;
    }
}
