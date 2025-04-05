struct MapStruct {
    m: map<Int, Int>;
}

contract TestMapStruct {
    receive() {
         let ms: MapStruct = MapStruct{ m: emptyMap() };
         ms.m.set(1, 100);
         if (ms.m.exists(1)) {
             dump(ms.m.get(1));
         }
    }
}
