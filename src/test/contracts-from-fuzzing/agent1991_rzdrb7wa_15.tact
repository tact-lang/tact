struct Inner1 { a: Int }
struct Inner2 { b: Int }
struct OuterUnion {
    a1: Inner1?;
    a2: Inner2?;
}

contract NestedUnion {
    field: OuterUnion;

    init() {
        self.field = OuterUnion{ a1: null, a2: null };
    }
}