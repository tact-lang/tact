struct A { x: Int; y: Int; }
struct B { a: A; z: Int; }

contract NestedEmbedded {
    val: B;

    init() {
        self.val = B{
            a: A{ x:123, y:456 },
            z: 789,
        };
    }
}