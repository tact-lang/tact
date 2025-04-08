struct BigNested {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

struct Outer {
    s1: BigNested;
    s2: BigNested;
    s3: BigNested;
}

contract ManyBigNesteds {
    store: Outer;

    init() {
        self.store = Outer{
            s1: BigNested{ f1: 1, f2: true, f3: "a", f4: null, f5: false, f6: null },
            s2: BigNested{ f1: 2, f2: false, f3: "b", f4: 4, f5: null, f6: "c" },
            s3: BigNested{ f1: 3, f2: true, f3: "d", f4: null, f5: null, f6: null },
        };
    }
}