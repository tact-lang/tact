struct A { x: Int; y: Bool }
struct B { a: A; z: String }

contract Layers {
    field: B;
    
    init() {
        self.field = B {
            a: A {
                x: 7,
                y: true
            },
            z: "abc"
        };
    }
}