struct CompactPoint {
    lat: Int as int32;
    lon: Int as int32;
}

contract StructInTwoLayers {
    c1: CompactPoint;
    c2: CompactPoint;

    init() {
        self.c1 = CompactPoint{lat:1,lon:2};
        self.c2 = CompactPoint{lat:3,lon:4};
    }
}
