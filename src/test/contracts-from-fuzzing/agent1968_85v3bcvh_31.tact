struct RecursiveOption {
    a: Int?;
    b: InnerStruct?;
}

struct InnerStruct {
    c: Bool?;
    d: String?;
}

contract Test32 {
    val: RecursiveOption;
    init() {
        self.val = RecursiveOption{
            a:null,
            b:InnerStruct{c:null,d:null}
        };
    }
}