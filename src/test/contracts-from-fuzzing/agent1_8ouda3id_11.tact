struct Pair {
    a: Int;
    b: Int;
}

contract Test9 {
    p: Pair = Pair{ a: 1, b: 2 };

    receive() {}

    get fun getPairWithOffset(offset: Int): Pair {
        return Pair{ a: self.p.a + offset, b: self.p.b + offset };
    }
}
