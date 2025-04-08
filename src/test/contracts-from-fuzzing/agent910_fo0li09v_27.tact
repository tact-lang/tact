struct SInner {
    a: Int?;
    b: Bool?;
    c: String;
}

contract StructOptComplex {
    s: SInner;

    init() {
        self.s = SInner{
            a:null,
            b:true,
            c:"hello"
        };
    }
}