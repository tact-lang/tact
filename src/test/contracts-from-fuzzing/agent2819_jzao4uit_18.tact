struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    opts: ManyOptions;

    init() {
        self.opts = ManyOptions{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}