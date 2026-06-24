struct Coordinates {
    latitude: Int;
    longitude: Int;
}

struct LocationInfo {
    name: String;
    coords: Coordinates;
}

struct Wrapper {
    loc: LocationInfo;
    isKnown: Bool;
}

contract TripleNested {
    wrapped: Wrapper;

    init() {
        self.wrapped = Wrapper{
            loc: LocationInfo{
                name: "SomePoint",
                coords: Coordinates{
                    latitude: 123,
                    longitude: 456
                }
            },
            isKnown: true
        };
    }
}
