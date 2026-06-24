struct MapStruct {
    mp: map<Int, Int>;
}

contract TestMapField {
    receive() {
        let ms: MapStruct = MapStruct { mp: emptyMap() };
        ms.mp.set(1, 100);
    }
}
