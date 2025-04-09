message(0xAAAAAAA) Embedded {
    num: Int;
}

struct Inner {
    msg: Embedded?;
    txt: String?;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{ msg: Embedded{ num: 555 }, txt: null };
    }
}
