struct NestedA { x: Int; }
struct NestedB { y: Bool; }

struct Composite {
    a: NestedA?;
    b: NestedB?;
}

contract CompositeOptionals {
    data: Composite;

    init() {
        self.data = Composite{
            a: null,
            b: null
        };
    }
}
