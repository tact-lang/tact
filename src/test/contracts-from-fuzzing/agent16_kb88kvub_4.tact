struct Pair {
    a: Int;
    b: Bool;
}

contract TestPair {
    receive() {}

    get fun getPair(): Pair {
         return Pair{ a: 123, b: true };
    }
}
