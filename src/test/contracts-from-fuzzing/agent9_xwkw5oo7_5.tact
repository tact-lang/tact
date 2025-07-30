struct Pair {
    a: Int;
    b: Int;
}

contract TestGetter {
    v: Int = 42;

    get fun get_pair(flag: Bool): Pair {
        if (flag) {
            return Pair { a: self.v, b: self.v + 1 };
        } else {
            repeat(3) {
                if (self.v > 40) {
                    return Pair { a: self.v, b: self.v - 1 };
                }
            }
            return Pair { a: 0, b: 0 };
        }
    }
}
