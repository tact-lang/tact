struct Combo {
    x: Int;
    y: Int?;
    z: Int = 5;
}

contract MixedInit {
    payload: Combo;
    init() {
        self.payload = Combo{
            x: 10,
            y: null
        };
    }
}
