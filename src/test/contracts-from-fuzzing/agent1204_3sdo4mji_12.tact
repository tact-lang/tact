struct Mix {
    i: Int;
    s: String;
    b: Bool;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract MixedDiversity {
    record: Mix;

    init() {
        self.record = Mix{
            i:1,
            s:"abc",
            b: true,
            optI: null,
            optS: null,
            optB: null
        };
    }
}
