struct LargeNested {
    s1: String;
    s2: String?;
    s3: String;
    s4: Int;
    s5: Int?;
    s6: Bool;
    s7: Bool?;
}

struct NestLevel2 {
    inner: LargeNested;
    val: Int;
}

contract BigNestedContract {
    store: NestLevel2 = NestLevel2{
        inner: LargeNested{
            s1:"x", s2:null, s3:"y", s4:4, s5:null, s6:true, s7:null
        }, val: 99
    };

    init() {
        self.store = self.store;
    }

    receive() {
        let _ = self.store;
    }
}