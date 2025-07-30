struct Child { x: Int; }
struct Parent { child: Child?; }

contract TestContract {
    data: Parent;

    init() {
        self.data = Parent{ child: null };
    }
}