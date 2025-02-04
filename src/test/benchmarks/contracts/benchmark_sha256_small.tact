asm fun sha256_native(s: String): Int {
    SHA256U
}

message HashData {
    value: String;
}

contract Sha256Small {
    result: Int = 0;

    receive() {}

    receive(h: HashData) {
        self.result += sha256_native(h.value);
    }

    get fun res(): Int {
        return self.result;
    }
}
