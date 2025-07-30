struct Place {
    x: Int;
    y: Int;
}

struct HasPlaceOpt {
    p: Place?;
}

contract OptNestedStruct {
    coor: HasPlaceOpt;

    init() {
        self.coor = HasPlaceOpt{ p: null };
    }
}