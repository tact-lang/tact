struct MapStruct {
    m: map<Int, Int>;
}

struct OptionalStruct {
    opt: Int?;
}

struct DeepNest {
    mapField: MapStruct;
    optField: OptionalStruct?;
    val: Int;
}

contract NestedComplex {
    receive() {
        let ms = MapStruct{ m: emptyMap() };
        let os = OptionalStruct{ opt: 100 };
        let dn = DeepNest{ mapField: ms, optField: os, val: 42 };
    }
}
