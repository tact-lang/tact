struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    o: Opts;

    init() {
        self.o = Opts{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}
