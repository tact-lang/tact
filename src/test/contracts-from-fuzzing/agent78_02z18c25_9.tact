struct Pair {
    a: Int;
    b: Int;
}

contract Test8 {
    // Minimal receiver for full contract compilation
    receive () {}

    // Getter function returning a tuple represented as a struct
    get fun getPair(): Pair? {
        return Pair{ a: 10, b: 20 };
    }
}
