struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract Test {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{
            a:null,b:true,c:null,d:4,e:null,f:"hello"
        };
    }
}