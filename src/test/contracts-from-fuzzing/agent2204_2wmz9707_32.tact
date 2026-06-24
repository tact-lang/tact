struct Tiny { a: Int }

struct MiddleOpt {
    tinyOpt: Tiny?;
}

struct OuterOpt {
    mid: MiddleOpt?;
}

contract NestedNullableStructs {
    s: OuterOpt;
    init() {
        self.s = OuterOpt{ mid: null };
    }
}