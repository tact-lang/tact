struct Coordinates {
    x: Int;
    y: Int;
}

struct Meta {
    title: String;
    caption: String?;
}

contract NestedOpts {
    coords: Coordinates?;
    meta: Meta?;

    init() {
        self.coords = null;
        self.meta = null;
    }

    receive() {
        self.coords = Coordinates{x:1,y:2};
        self.meta = Meta{ title:"t", caption:null };
    }
}