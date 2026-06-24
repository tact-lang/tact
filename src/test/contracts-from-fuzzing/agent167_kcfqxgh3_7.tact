// Many optional deeply nested struct fields
struct D {
    val: Int?; 
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract DeepOptions {
    root: A;

    init() {
        self.root = A{
            b: B{ c: C{ d: D{ val: 42 } } }
        };
    }
}