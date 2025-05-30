struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
}

contract Test13 {
    vals: ManyOptionals;

    init() {
        self.vals = ManyOptionals{
            a:null, b:123, c:true, d:null
        };
    }
}
