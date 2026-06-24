struct TuplePair {
    a: Int;
    b: Int;
}

contract Test9 {
    t: TuplePair = TuplePair{ a: 10, b: 20 };

    receive() {}

    get fun getPair(): TuplePair? {
        return self.t;
    }
}
