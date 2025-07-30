struct MapStruct {
    m: map<Int, Int>
}

contract TestMapStruct {
    receive() {
        let ms = MapStruct{ m: emptyMap() };
        ms.m.set(0, 111);
        ms.m.set(1, 222);
        dump(ms.m.get(1)!!);
    }
}
