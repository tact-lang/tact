message HashData {
    value: String;
}

contract Sha256Big {
    result: Int = 0;

    receive() {}

    receive(h: HashData) {
        self.result += sha256(h.value);
    }

    get fun res(): Int {
        return self.result;
    }
}
