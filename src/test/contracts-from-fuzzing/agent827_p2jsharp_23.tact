struct Inside {
    val: Int = 100;
    msg: String = "hello";
}

struct Outside {
    inner: Inside = Inside{};
    count: Int = 5;
}

contract StructWithDefaults {
    data: Outside = Outside{};

    receive() {
        self.data = self.data;
    }
}