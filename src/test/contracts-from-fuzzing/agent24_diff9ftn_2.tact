struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    flag: Bool;
}

struct S3 {
    s2a: S2;
    s2b: S2;
}

contract ManyNested {
    record: S3;
    
    init() {
        self.record = S3{
            s2a: S2{ s1a: S1{ a: 1, b: null }, s1b: S1{ a: 2, b: 3 }, flag: true },
            s2b: S2{ s1a: S1{ a: 4, b: 5 }, s1b: S1{ a: 6, b: 7 }, flag: false }
        };
    }
}