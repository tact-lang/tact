struct Annoying {
    _x: Int;
    _y: Bool;
    _z: String?;
}

contract UnderScores {
    ann: Annoying;
    init() {
        self.ann = Annoying {
            _x: 1,
            _y: false,
            _z: null,
        };
    }
}