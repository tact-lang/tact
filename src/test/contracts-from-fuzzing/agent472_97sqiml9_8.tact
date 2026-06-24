struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptsTest {
    opts: ManyOptionals;
    init() {
        self.opts = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}