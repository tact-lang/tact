struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct S4 { d: Address; }
struct S5 { e: Int?; }

struct BigNested {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
    f5: S5;
    extra: Int;
}

contract LotsOfNestedStructs {
    data: BigNested;

    init() {
        self.data = BigNested{
            f1: S1{ a:1 },
            f2: S2{ b:true },
            f3: S3{ c:"hi" },
            f4: S4{ d:myAddress() },
            f5: S5{ e:null },
            extra: 123,
        };
    }
}