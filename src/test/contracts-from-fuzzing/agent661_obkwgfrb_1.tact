struct Nest {
    inner1: Int;
    inner2: Bool;
}

contract DeepNested {
    outer1: Int;
    outer2: Nest;
    outer3: Bool;

    init() {
        self.outer1 = 1;
        self.outer2 = Nest{ inner1: 2, inner2: true };
        self.outer3 = false;
    }
}