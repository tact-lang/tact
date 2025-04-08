struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

struct TopLevel {
    s1: S1;
    optS2: S2?;
    s3: S3;
    flag: Bool;
    note: String;
    num: Int;
}

contract NestedOptional {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            s1: S1{ a: 42 },
            optS2: null,
            s3: S3{ c: "hi" },
            flag: false,
            note: "note",
            num: 99,
        };
    }
}
