struct Pair {
    a: Int;
    b: Int;
}

contract Test3 {
    receive() {}

    get fun get_pair(): Pair {
        return Pair { a: 10, b: 20 };
    }
}
