struct MapStruct {
    Items: map<Int, Int>;
}

contract TestMap {
    receive() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        let ms: MapStruct = MapStruct { Items: m };
        dump(ms.Items.get(1)!!);
    }
}
