struct RecA { val: Int; }
struct RecB { 
    s: RecA; 
    optS: RecA?; 
}

contract MultiOpt {
    s1: RecB?;
    s2: RecB?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}