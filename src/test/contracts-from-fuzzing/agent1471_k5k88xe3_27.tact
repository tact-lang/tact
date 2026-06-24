struct BigNested {
    a: Int;
    b: Bool;
    c: String;
}

struct LargerNested {
    nest1: BigNested;
    nest2: BigNested;
    nest3: BigNested;
    nest4: BigNested;
}

contract ManyDeepNested {
    st: LargerNested;

    init() {
        self.st = LargerNested{
            nest1: BigNested{a: 1, b: true, c: "a"},
            nest2: BigNested{a: 2, b: false, c: "b"},
            nest3: BigNested{a: 3, b: true, c: "c"},
            nest4: BigNested{a: 4, b: false, c: "d"}
        };
    }
}