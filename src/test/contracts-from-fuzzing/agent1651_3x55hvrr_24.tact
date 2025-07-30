struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test24 {
    val: ManyOptions;

    init() {
        self.val = ManyOptions{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}
