struct Variant1 { a: Int }
struct Variant2 { b: String }

struct UnionLike {
    tag: Int;
    var1: Variant1?;
    var2: Variant2?;
}

contract TaggedUnionContract {
    data: UnionLike;

    init() {
        self.data = UnionLike{
            tag: 1,
            var1: Variant1{ a: 42 },
            var2: null
        };
    }
}