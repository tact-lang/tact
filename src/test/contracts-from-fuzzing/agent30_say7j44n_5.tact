struct MapStruct {
    m: map<Int, Int>;
}

contract Test {
    data: MapStruct;
    init() {
        self.data = MapStruct{ m: emptyMap() };
    }
}