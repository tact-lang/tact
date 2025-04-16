struct MapStruct {
    m: map<Int, Int>;
}

struct OptionalStruct {
    maybe: Int?;
    nested: MapStruct;
}

contract TestOptionalMap {
    receive() {
        // Create an empty map and set a key-value pair
        let ms = MapStruct { m: emptyMap() };
        ms.m.set(1, 100);
        
        // Instantiate OptionalStruct with an optional int and nested map struct
        let s = OptionalStruct { maybe: 200, nested: ms };
    }
}
