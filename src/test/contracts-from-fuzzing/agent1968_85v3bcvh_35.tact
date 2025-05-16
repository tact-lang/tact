struct TripleNested {
    a: Int;
    b: Level2;
}

struct Level2 {
    c: Bool;
    d: Level3;
}

struct Level3 {
    e: String;
    f: Address?;
}

contract Test36 {
    val: TripleNested;
    init() {
        self.val = TripleNested{
            a:1,
            b:Level2{
                c:true,
                d:Level3{e:"hi",f:null}
            }
        };
    }
}