struct MapHolder {
    items: map<Int, Int>;
}

contract TestContract {
    mapData: map<Address, MapHolder>;
    init() {
        self.mapData = emptyMap();
    }
}