struct S1 { f1: Int; }
struct S2 { s1: S1; f2: Bool; }
struct S3 { s2: S2; f3: String; }
struct S4 { s3: S3; f4: Cell; }

contract LargeNestedStruct {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ f1: 42 },
                    f2: false
                },
                f3: "ok"
            },
            f4: emptyCell()
        };
    }
}