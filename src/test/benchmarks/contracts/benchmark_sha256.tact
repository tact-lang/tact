asm fun sha256_native(s: String): Int {
    SHA256U
}

message HashBig {
    value: String;
}

message HashSmall {
    value: String;
}

contract Sha256 {
    result: Int = 0;

    receive() {}

    receive(h: HashBig) {
        self.result += sha256(h.value);
    }

    receive(h: HashSmall) {
        self.result += sha256_native(h.value);
    }

    get fun res(): Int {
        return self.result;
    }
}
