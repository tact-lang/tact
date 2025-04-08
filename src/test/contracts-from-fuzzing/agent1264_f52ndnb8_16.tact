struct InnerNest {
    val: Int;
}

struct MidNest {
    inner: InnerNest;
}

struct OuterOpt {
    mid: MidNest?;
}

contract OptionalMidLevel {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ mid: null };
    }
}