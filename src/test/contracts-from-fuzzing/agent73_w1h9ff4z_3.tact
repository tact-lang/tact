struct Pair {
    a: Int;
    b: Int;
}

contract Test3 {
    receive() {}

    get fun getPair(): Pair {
        return Pair{ a: 10, b: 20 };
    }
}
