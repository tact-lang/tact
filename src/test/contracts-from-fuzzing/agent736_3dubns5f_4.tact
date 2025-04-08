struct ManyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract ManyOptionalFields {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{ x: null, y: null, z: null };
    }
}