struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

struct PointOpt {
    coord: Coordinates?;
    label: String?;
}

contract SerializeMix {
    pos: PointOpt;

    init() {
        self.pos = PointOpt{
            coord: null,
            label: null
        };
    }
}