struct Pair {
    a: Int;
    b: Int;
}

contract TestStruct {
    pair: Pair;

    init() {
        self.pair = Pair{
            a: 10,
            b: 20
        };
    }

    receive() {}

    get fun getPair(): Pair {
        return self.pair;
    }
}
