struct NestedA {
    x: Int;
}
struct NestedB {
    y: Bool;
    nestedA: NestedA;
}
struct NestedC {
    z: Int?;
    nestedB: NestedB;
}
contract TriangleNest {
    data: NestedC;

    init() {
        self.data = NestedC{
            z: null,
            nestedB: NestedB{
                y: true,
                nestedA: NestedA{x:5}
            }
        };
    }
}