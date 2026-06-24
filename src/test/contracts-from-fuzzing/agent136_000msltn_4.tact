struct BigNested {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract LotsOfFields {
    p1: Int;
    p2: Int;
    p3: Int;
    p4: Int;
    p5: Int;
    nest: BigNested;

    init() {
        self.p1 = 1;
        self.p2 = 2;
        self.p3 = 3;
        self.p4 = 4;
        self.p5 = 5;
        self.nest = BigNested{a:10,b:20,c:30,d:40,e:50,f:60};
    }
}