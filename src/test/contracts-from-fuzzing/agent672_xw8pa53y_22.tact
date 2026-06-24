// Compose deep optional chain
struct A { val: Int; }
struct B { val: A?; }
struct C { val: B?; }
struct D { val: C?; }

contract DeepNestedOptionals {
    root: D;
    init() {
        self.root = D{ val: C{ val: B{ val: A{ val: 42 } } } };
    }
}
