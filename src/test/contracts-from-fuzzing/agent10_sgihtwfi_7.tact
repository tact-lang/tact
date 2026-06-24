struct MapStruct {
    m: map<Int, Int>;
}

contract Test {
    receive() {
        let ms = MapStruct {
            m: emptyMap()
        };
    }
}
