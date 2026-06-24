struct MapStruct {
    Pairs: map<Int, Int>;
}

contract TestMap {
    receive() {
        let s: MapStruct = MapStruct{ Pairs: emptyMap() };
        s.Pairs.set(1, 11);
        s.Pairs.set(2, 22);
    }
}
