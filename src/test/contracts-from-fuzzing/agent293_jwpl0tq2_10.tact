struct NullableAddr {
    addr: Address? = null;
}

contract DefaultOptional {
    val: NullableAddr;

    init() {
        self.val = NullableAddr{};
    }
}