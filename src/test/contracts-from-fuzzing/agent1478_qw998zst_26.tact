struct InnerMost {
    s: String?;
    num: Int?;
}

struct Middle {
    flag: Bool?;
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    complex: Outer;

    init() {
        self.complex = Outer{ mid: null };
    }
}
