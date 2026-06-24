struct ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: String?;
}

contract TestContract {
    opts: ManyOptions;
    init() {
        self.opts = ManyOptions{ a:null, b:true, c:null, d:5, e:"hello" };
    }
}