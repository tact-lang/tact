// Serialize a struct with many trailing optional primitives
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Address?;
}

contract ChainOptTrailing {
    st: ManyOpts;
    init() {
        self.st = ManyOpts{a:null,b:null,c:null,d:null};
    }
}