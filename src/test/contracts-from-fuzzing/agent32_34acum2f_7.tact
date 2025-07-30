struct Pair {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {}

    get fun getPair(): Pair {
         return Pair{a: 123, b: true};
    }
}
