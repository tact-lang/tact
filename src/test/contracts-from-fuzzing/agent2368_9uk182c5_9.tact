struct Child1 { x: Int; }
struct Child2 { y: Int; }
struct Child3 { z: Int; }

struct ParentWithOptions {
    c1: Child1?;
    c2: Child2?;
    c3: Child3?;
}

contract OptionalNested {
    data: ParentWithOptions;

    init() {
        self.data = ParentWithOptions{
            c1: null,
            c2: Child2 { y: 22 },
            c3: null
        };
    }
}