struct Large {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: Int;
    f10: Bool;
}

contract ManyFields {
    data: Large = Large {
        f1: 1, f2: 2, f3: 3, f4: true, f5: false, f6: true,
        f7: null, f8: false, f9: 9, f10: true
    };
    sum: Int = 0;

    init() {
        self.sum = self.data.f1 + self.data.f2 + self.data.f3 + self.data.f9;
    }
}
