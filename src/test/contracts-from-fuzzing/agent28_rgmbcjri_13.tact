struct InnerStruct {
    A: Int;
    B: Int?;
}

struct MiddleStruct {
    I: InnerStruct;
    // Map with key Int and value InnerStruct
    M: map<Int, InnerStruct>;
}

struct OuterStruct {
    L: MiddleStruct;
    Extra: Int;
}

contract TestComplexNested {
    receive() {
        let inner: InnerStruct = InnerStruct { A: 42, B: null };
        let middle: MiddleStruct = MiddleStruct { I: inner, M: emptyMap() };
        // Insert the inner struct into the map
        middle.M.set(1, inner);
        let outer: OuterStruct = OuterStruct { L: middle, Extra: 100 };
        dump(outer.L.I.A + outer.Extra);
    }
}
