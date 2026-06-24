struct MultiOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestNulls {
    vals: MultiOpt;
    init() {
        self.vals = MultiOpt{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}