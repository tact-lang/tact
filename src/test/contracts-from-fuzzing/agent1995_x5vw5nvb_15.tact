struct S1 { a: Int; }
struct S2 { b: Int as uint64; }
struct S3 { c: Bool; }
struct NestedMany {
    f1: S1;
    f2: S2;
    f3: S3;
    text: String;
    num: Int; 
    optNum: Int?;
}

contract NestedFields {
    item: NestedMany;
    init() {
        self.item = NestedMany{
            f1: S1{a:1},
            f2: S2{b:42},
            f3: S3{c:true},
            text: "great",
            num: 1234,
            optNum: null
        };
    }
}