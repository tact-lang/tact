struct MapStruct {
    mapping: map<Int, Int>;
}

contract TestContract {
    m: MapStruct = MapStruct{
        mapping: emptyMap()
    };
    receive() {
        let _ = self.m;
    }
}