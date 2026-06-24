struct Pair {
    first: Int;
    second: Int;
}

contract TestCompositeGetter {
    a: Int = 42;
    b: Int = 43;

    receive() {}

    get fun getPair(): Pair {
        return Pair{first: self.a, second: self.b};
    }
}
