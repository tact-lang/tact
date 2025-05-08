struct OptionalsTop {
    val: Int?;
    inner: OptionalsInner?;
}

struct OptionalsInner {
    str: String?;
    address: Address?;
}

contract FuzzOptionalsTop {
    store: OptionalsTop;

    init() {
        self.store = OptionalsTop {
            val: null,
            inner: OptionalsInner {
                str: "hey",
                address: sender()
            }
        };
    }
}
