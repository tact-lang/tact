struct Optionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    opts: Optionals;

    init() {
        self.opts = Optionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}