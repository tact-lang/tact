struct Combo {
    x: Int = 1;
    y: String? = null;
    z: Bool = false;
}

contract MixedInitAndDefault {
    data: Combo;
    count: Int = 5;
    status: Bool;

    init() {
        self.data = Combo{ x: 42, y: null, z: true };
        self.status = true;
    }
}