struct S1 {
    f: Bool; g: Int; h: String;
}

struct S2 {
    i: Int?; j: String;
}

contract OptStructs {
    s1: S1?;
    s2: S2?;
    separate: Int?;

    init() {
        self.s1 = S1{f:false,g:1,h:"a"};
        self.s2 = null;
        self.separate = 10;
    }
}