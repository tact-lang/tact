struct BigNested {
    x: Int;
    y: Bool;
    z: String?;
}

contract ManyStructFields {
    f1: BigNested;
    f2: BigNested;
    f3: BigNested;
    f4: BigNested;

    init() {
        let val = BigNested{ x: 1, y: false, z: null };
        self.f1 = val;
        self.f2 = val;
        self.f3 = val;
        self.f4 = val;
    }
}
