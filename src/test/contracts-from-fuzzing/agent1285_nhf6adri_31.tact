// Nested struct with optional inner and optional primitives inside it
struct Deep {
    x: Int?;
    y: Bool?;
}

struct Outer {
    i: Int?;
    j: Deep?;
}

contract TestContract {
    val: Outer?;
    init() {
        self.val = Outer{
            i: null,
            j: Deep {
                x: null,
                y: true
            }
        };
    }
}