struct Pair {
    a: Int;
    b: Int;
}

contract TestGetterWithParams {
    v: Int = 20;

    receive() {}

    // Getter with parameters that returns a struct
    get fun getPair(x: Int, y: Int): Pair {
        return Pair { a: self.v + x, b: self.v + y };
    }
}
