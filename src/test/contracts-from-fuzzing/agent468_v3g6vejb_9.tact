struct Combo {
    x: Int;
    y: Int?;
    z: String?;
    b: Bool;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{ x: 1, y: 2, z: null, b: true };
    }
}