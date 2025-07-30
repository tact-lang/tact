struct Hierarchy1 { x: Int; }
struct Hierarchy2 { h1: Hierarchy1; }
struct Hierarchy3 { h2: Hierarchy2; }

contract NestedHierarchy {
    d: Hierarchy3;
    init() {
        self.d = Hierarchy3{
            h2: Hierarchy2{
                h1: Hierarchy1{ x: 101 }
            }
        };
    }
}