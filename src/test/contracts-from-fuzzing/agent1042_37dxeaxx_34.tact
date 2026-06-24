struct Pair {
    a: Int;
    b: Int;
}

contract SeparateInit {
    p: Pair;

    init() {
        self.p = Pair{a:1,b:2};
        self.p = Pair{a:3,b:4};
    }
}