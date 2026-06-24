struct S1 { a: Int = 1; }
struct S2 { a: Int = 2; }
struct S3 { a: Int = 3; }
struct S4 { a: Int = 4; }
struct S5 { a: Int = 5; }

struct BigNested {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    note: String = "note";
    flag: Bool = false;
}

contract Test {
    big: BigNested = BigNested{
        s1: S1{}, s2: S2{}, s3: S3{}, s4: S4{}, s5: S5{}, note: "note", flag: false
    };
    
    init() {
        self.big = BigNested{
            s1: S1{a: 11},
            s2: S2{a: 22},
            s3: S3{a: 33},
            s4: S4{a: 44},
            s5: S5{a: 55},
            note: "hello",
            flag: true,
        };
    }
}