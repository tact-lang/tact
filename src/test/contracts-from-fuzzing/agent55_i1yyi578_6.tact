struct Optionals {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestContract {
    x: Int?;
    y: Bool?;
    z: Address?;
    s: Optionals;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.s = Optionals{ x: null, y: null, z: null };
    }
}