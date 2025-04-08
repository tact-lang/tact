struct S1 { f1: Int; f2: Bool }
struct S2 { f3: String; f4: S1 }
struct S3 { f5: Address; f6: S2 }

contract NestedMany {
    st: S3;

    init() {
        self.st = S3{
            f5: myAddress(),
            f6: S2{
                f3: "a",
                f4: S1{ f1: 7, f2:false }
            }
        };
    }
}
