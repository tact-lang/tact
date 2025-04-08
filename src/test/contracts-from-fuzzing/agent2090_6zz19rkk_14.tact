struct Coord {
    x: Int;
    y: Int;
    label: String?;
}

message(42) Tagged {
    point: Coord;
    tag: String;
    flag: Bool;
}

contract MixPersist {
    coord: Coord;
    tagged: Tagged;
    optTag: Tagged?;

    init() {
        self.coord = Coord{ x:1, y:2, label:null };
        self.tagged = Tagged{ point:self.coord, tag:"t", flag:true };
        self.optTag = null;
    }
}