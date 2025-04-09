struct S1 { a: Int; b: Bool; }
struct S2 { c: String; d: Cell; }
struct S3 { e: Slice; f: Address; }

struct TopStruct {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract MegaStructInInit {
    mega: TopStruct;

    init() {
        self.mega = TopStruct{
            s1: S1{a:1,b:true},
            s2: S2{c:"x", d: emptyCell()},
            s3: S3{e: emptyCell().asSlice(), f: myAddress()}
        };
    }
}