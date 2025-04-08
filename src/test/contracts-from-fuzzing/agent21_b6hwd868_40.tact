struct AOpt {
    inner: Int?;
}

struct BOpt {
    a: AOpt?;
}

contract NestedNulls {
    b: BOpt;

    init() {
        self.b = BOpt{ a: null };
    }
}