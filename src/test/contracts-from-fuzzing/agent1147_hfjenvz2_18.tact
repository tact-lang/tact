struct Child {
    xx: Int?;
}
struct Parent {
    aa: Child;
}

contract TestContract {
    p: Parent;

    init() {
        self.p = Parent {
            aa: Child{ xx:null }
        };
    }
}