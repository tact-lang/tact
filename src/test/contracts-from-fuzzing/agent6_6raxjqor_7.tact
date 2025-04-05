struct MapStruct {
    m: map<Int, Int>;
}

contract MapTest {
    receive() {
         let ms: MapStruct = MapStruct { m: emptyMap() };
         dump(ms.m);
    }
}
