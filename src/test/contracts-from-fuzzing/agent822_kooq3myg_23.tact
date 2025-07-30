// struct with nested struct with optional nested
struct GrandChild { z: Int? }
struct Child { y: GrandChild }
struct Parent { x: Child }

contract TestContract {
    f: Parent;
    init() {
        self.f = Parent{
            x: Child{ y: GrandChild{ z: null } }
        };
    }
}
