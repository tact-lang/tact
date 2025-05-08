struct S1 {
    s2: S2?;
}

struct S2 {
    val: Int?;
}

struct STop {
    left: S1?;
    right: S1?;
}

contract MultiNullLayer {
    top: STop;

    init() {
        self.top = STop{ left: null, right: null };
    }
}