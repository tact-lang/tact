struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Int?;
    g: String?;
}

contract TestContract {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}