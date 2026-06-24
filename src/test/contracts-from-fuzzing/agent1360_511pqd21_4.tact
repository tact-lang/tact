struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract Opts {
    opts: ManyOptionals;
    
    init() {
        self.opts = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}