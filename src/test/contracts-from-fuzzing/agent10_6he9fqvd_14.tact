struct MapStruct {
    m: map<Int, Int>;
}

contract TestMapField {
    receive() {
        let ms = MapStruct { m: emptyMap() };
        ms.m.set(1, 42);
        let v = ms.m.get(1)!!; // should be 42
    }
}
