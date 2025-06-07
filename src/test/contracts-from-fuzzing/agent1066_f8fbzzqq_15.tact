struct Mixed {
    x: Int;
    y: String?;
    z: Bool;
}

contract MixedFields {
    m: Mixed;

    init() {
        self.m = Mixed{x: 1, y: null, z: true};
    }
}