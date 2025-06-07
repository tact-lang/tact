struct First {
    f: Int;
}

struct Second {
    g: Bool;
}

contract SplitStructs {
    s1: First;
    s2: Second;

    init() {
        self.s1 = First{f:10};
        self.s2 = Second{g:true};
    }
}