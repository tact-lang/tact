struct Child1 { v1: Int }
struct Child2 { v2: Bool }
struct Container {
    a: Child1;
    b: Child2;
}

contract StructOfStructs {
    s: Container;

    init() {
        self.s = Container{a: Child1{v1: 7}, b: Child2{v2: false}};
    }
}