struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
}

contract TestContract {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a:null, b:1, c:null, d:true, e:null
        };
    }
}