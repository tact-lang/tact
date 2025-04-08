// deeply nested multiple structs with optional fields
struct A { x: Int?; y: B; }
struct B { x: Int; y: C?; }
struct C { x: Bool?; y: D; }
struct D { x: String; }

contract TestContract {
    val: A;

    init() {
        self.val = A{
            x: null,
            y: B{
                x: 1,
                y: C{
                    x: true,
                    y: D { x: "deep" }
                }
            }
        };
    }
}