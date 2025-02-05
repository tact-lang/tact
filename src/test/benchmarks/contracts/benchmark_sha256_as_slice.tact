message HashData {
    value: String;
}

contract Sha256AsSlice {
    result: Int = 0;

    receive() {}

    receive(h: HashData) {
        self.result += sha256(h.value.asSlice());
    }

    get fun res(): Int {
        return self.result;
    }
}
