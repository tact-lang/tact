struct Inner {
    deep: Int?;
}

struct Middle {
    inn: Inner;
    flag: Bool;
}

contract OptionalStructs {
    val: Middle? = null;

    init() {
        self.val = null;
    }
}