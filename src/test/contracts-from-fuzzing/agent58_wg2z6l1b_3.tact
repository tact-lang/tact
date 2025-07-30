struct Pair {
    a: Int;
    b: Int;
}

contract TestStruct {
    p: Pair;

    init() {
        self.p = Pair{ a: 10, b: 20 };
    }

    receive() {}

    get fun getPair(): Pair {
        return self.p;
    }
}
