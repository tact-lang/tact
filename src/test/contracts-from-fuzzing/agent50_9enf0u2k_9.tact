struct Pair {
    first: Int;
    second: Int;
}

contract TestTuple {
    receive() {}

    // Getter function that takes two parameters and returns a Pair struct
    get fun getPair(a: Int, b: Int): Pair {
        return Pair { first: a, second: b };
    }
}
