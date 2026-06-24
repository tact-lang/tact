struct Incomplete {
    x: Int;
    y: Int?;
}

contract PartialInit {
    f: Incomplete;

    init() {
        self.f = Incomplete{ x: 7, y: null };
    }
}