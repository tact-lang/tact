struct DescriptorA { x: Int }
struct DescriptorB { y: Int }

struct Outer {
    a: DescriptorA;
    b: DescriptorB;
}

contract MultipleStructFields {
    outer: Outer;

    init() {
        self.outer = Outer{
            a: DescriptorA{x:5},
            b: DescriptorB{y:7}
        };
    }

    receive() {
        let _ = self.outer.a.x + self.outer.b.y;
    }
}