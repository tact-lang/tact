struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: Int }
struct Combo {
    f1: S1;
    f2: S2;
    f3: S3;
}
contract NestedMultiStruct {
    data: Combo;
    init() {
        self.data = Combo{
            f1: S1{a:1}, f2: S2{b:true}, f3: S3{c:2}
        };
    }
}