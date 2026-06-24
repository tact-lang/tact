struct OptionalInner {
    value: Int?
}

struct MapInner {
    values: map<Int, Int>
}

struct Combined {
    opt: OptionalInner;
    mapF: MapInner;
    normal: Int
}

contract TestOptionalMapStruct {
    receive() {
        let empty: map<Int, Int> = emptyMap();
        let inst = Combined{
            opt: OptionalInner { value: null },
            mapF: MapInner { values: empty },
            normal: 123
        };
    }
}
