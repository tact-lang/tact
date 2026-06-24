// test nested structs with optionals & defaults combined
struct Deep {
    val: Int? = null;
    flag: Bool = false;
}

struct Mid {
    d: Deep;
    s: String? = null;
}

contract TestContract {
    m: Mid;
    init() {
        self.m = Mid{d: Deep{}};
    }
}