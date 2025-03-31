struct Pair {
    a: Int;
    b: Bool;
}

contract Test {
    value: Pair = Pair{a: 1, b: true};
    receive() {}

    get fun getPair(): Pair {
       return self.value;
    }
}
