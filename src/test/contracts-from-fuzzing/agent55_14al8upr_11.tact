struct MapWrapper {
    m: map<Int, Int>;
}

struct OptionalMapStruct {
    a: Int;
    optionalMap: MapWrapper?;
}

contract TestOptionalMap {
    init() {
        let s = OptionalMapStruct {
            a: 42,
            optionalMap: null
        };
    }
}
