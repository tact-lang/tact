struct DataStruct {
    a: Int;
    b: Bool;
}

contract ManyDefaults {
    x: Int = 5;
    y: Bool = true;
    s: DataStruct = DataStruct{ a: 1, b: false };

    init() {
        self.x = 10;
        self.y = false;
        self.s = DataStruct{ a: 2, b: true };
    }
}
