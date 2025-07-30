struct MultiTypeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract MultiOpt {
    s: MultiTypeOptional = MultiTypeOptional{
        a: null,b:null,c:null,d:null,e:null
    };

    init() {
        self.s.a = 1;
        self.s.b = true;
        self.s.c = "hi";
        self.s.d = emptyCell();
        self.s.e = emptyCell().asSlice();
    }
}