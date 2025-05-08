struct Inner {
    val: Int? = 11;
    txt: String? = "hi";
}

struct Outer {
    flag: Bool? = false;
    inner: Inner? = null;
}

contract Combo {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}