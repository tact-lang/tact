// test contract with many nested structs in one level
struct S1 { v: Int; }
struct S2 { v: Bool; }
struct S3 { v: Int; }
struct S4 { v: Bool; }
struct S5 { v: Int; }

struct Combo {
    one: S1;
    two: S2;
    three: S3;
    four: S4;
    five: S5;
}

contract WideNestedStructTest {
    data: Combo = Combo{
        one: S1{ v:1 },
        two: S2{ v:true },
        three: S3{ v:2 },
        four: S4{ v:false },
        five: S5{ v:3 }
    };

    init() {
        self.data = Combo{
            one: S1{ v:10 },
            two: S2{ v:false },
            three: S3{ v:20 },
            four: S4{ v:true },
            five: S5{ v:30 }
        };
    }
}