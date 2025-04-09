struct MapStruct {
    mapping: map<Int, Int>;
    opt: Int?;
}

contract Test5 {
    data: MapStruct;

    init() {
        self.data = MapStruct{ mapping: emptyMap(), opt: null };
    }
    receive() {}
}