struct NestedArrayLevel {
    a: Int;
    b: Bool;
}

struct TopLevelArrayStruct {
    s1: NestedArrayLevel;
    s2: NestedArrayLevel;
    s3: NestedArrayLevel;
}

contract ManyNestedStructs {
    storage: TopLevelArrayStruct;

    init() {
        self.storage = TopLevelArrayStruct{
            s1: NestedArrayLevel{ a: 1, b: true },
            s2: NestedArrayLevel{ a: 2, b: false },
            s3: NestedArrayLevel{ a: 3, b: true }
        };
    }
}