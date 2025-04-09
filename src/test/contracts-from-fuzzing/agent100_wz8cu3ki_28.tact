struct Tiny {
    a: Int as int1;
    b: Int as int1;
    c: Int as int1;
    d: Int as int1;
    e: Int as int1;
}

contract Test29 {
    tiny: Tiny;

    init() {
        self.tiny = Tiny{ a:1,b:1,c:1,d:1,e:1 };
    }
}