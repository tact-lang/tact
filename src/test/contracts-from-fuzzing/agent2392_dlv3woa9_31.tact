struct COpt {
    a: Int?;
}

contract InitedOpt {
    x: Int = 5;
    c: COpt;

    init() {
        self.c = COpt{ a: null };
    }
}