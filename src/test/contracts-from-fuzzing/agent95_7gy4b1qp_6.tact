struct BigOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
}

contract BigOptionalsContract {
    s: BigOptionals;

    init() {
        self.s = BigOptionals{
            a:null, b:true, c:null, d:emptyCell(), e:null, f:beginCell()
        };
    }
}