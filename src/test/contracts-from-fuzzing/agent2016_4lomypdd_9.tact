struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
}

contract Test {
    vals: ManyOptionals;
    init() {
        self.vals = ManyOptionals{
            a:null, b: null, c:null, d:null, e:null
        };
    }
}