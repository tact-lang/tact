struct NestedPrimitive {
    b: Bool;
}

struct OuterPrimitives {
    s: String;
    n: NestedPrimitive;
}

contract StructPrimitiveMix {
    storage: OuterPrimitives;

    init() {
        self.storage = OuterPrimitives{
            s: "hello",
            n: NestedPrimitive{ b: false }
        };
    }
}