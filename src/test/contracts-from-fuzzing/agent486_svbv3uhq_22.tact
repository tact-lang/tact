struct Innermost {
    val: Int?;
}

struct MidNest {
    inner: Innermost?;
}

struct OuterMost {
    mid: MidNest?;
}

contract OptChain {
    data: OuterMost?;

    init() {
        self.data = null;
    }
}