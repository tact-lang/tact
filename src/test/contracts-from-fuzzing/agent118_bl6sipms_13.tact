struct Pair {
    first: Int;
    second: Int;
}

contract GetterReturnTestFixed {
    v: Int = 10;
    receive() {}

    // Getter returning a struct Pair; using braces for the branches of if
    get fun getPair(flag: Bool): Pair {
        if (flag) {
            return Pair{first: self.v, second: self.v + 10};
        } else {
            return Pair{first: self.v - 10, second: self.v};
        }
    }
}
