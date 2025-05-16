// nested structs with defaulted fields
struct A {
    x: Int = 1;
    y: Bool = false;
}

struct B {
    a: A = A{};
    z: String = "hi";
}

contract NestedDefaulted {
    data: B;
    init() {
        self.data = B{};
    }
}