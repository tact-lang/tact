struct MapWrapper {
    m: map<Int, Int>;
}

contract MapInStructStorage {
    field: MapWrapper;

    init() {
        self.field = MapWrapper{
            m: emptyMap()
        };
    }
}