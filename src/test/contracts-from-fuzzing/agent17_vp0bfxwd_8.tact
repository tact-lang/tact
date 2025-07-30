struct MapStruct {
    M: map<Int, Int>;
}

contract TestMap {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        let s: MapStruct = MapStruct{ M: m };
    }
}
