struct Pair {
    x: Int;
    y: Bool;
}

contract Test4 {
    receive() {}

    get fun getPair(): Pair {
        return Pair{ x: 42, y: true };
    }
}
