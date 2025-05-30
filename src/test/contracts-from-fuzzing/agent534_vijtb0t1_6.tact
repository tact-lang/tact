struct SubNester {
    a: Int;
}

struct Nester {
    sub: SubNester;
}

contract CrossStruct {
    ns: Nester;
    
    init() {
        self.ns = Nester{
            sub: SubNester{ a: 77 },
        };
    }
}