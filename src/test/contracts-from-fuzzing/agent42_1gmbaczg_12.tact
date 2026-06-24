struct Pair {
    a: Int;
    b: Int;
}

contract TestTuple {
    // Getter returning a tuple, implemented as a struct Pair
    get fun getPair(): Pair {
        return Pair{ a: 10, b: 20 };
    }

    receive() {}
}
