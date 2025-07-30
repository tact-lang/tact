struct MapHolder {
    mapVal: map<Int, Int>;
}

contract MapInStruct {
    field: MapHolder;

    init() {
        self.field = MapHolder{ mapVal: emptyMap() };
    }
}