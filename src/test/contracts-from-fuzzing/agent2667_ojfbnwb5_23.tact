struct ManySmallDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
    f: Int = 5;
}

contract ManySmallDefaultsContract {
    data: ManySmallDefaults;

    init() {
        self.data = ManySmallDefaults{};
    }

    receive() {
        self.data = ManySmallDefaults{a: 10, b: 11, c: 12, d: 13, e: 14, f: 15};
    }
}