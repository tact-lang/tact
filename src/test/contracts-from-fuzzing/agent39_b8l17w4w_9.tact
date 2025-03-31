struct Pair { first: Int; second: Int }

contract TestGetterPairImproved {
    v: Int = 0;

    receive() {}

    get fun getPair(): Pair {
        if (self.v < 10) {
            return Pair { first: self.v, second: self.v + 1 };
        }
        return Pair { first: self.v, second: self.v - 1 };
    }
}
