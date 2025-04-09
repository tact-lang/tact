struct S1 { x: Int; }
struct S2 { x: Bool; }
struct UnionLike {
    variantA: S1?;
    variantB: S2?;
}

contract OptionalVariants {
    u: UnionLike;

    init() {
        self.u = UnionLike{
            variantA: null,
            variantB: S2{ x: true }
        };
    }
}
