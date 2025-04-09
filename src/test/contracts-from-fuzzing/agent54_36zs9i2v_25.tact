// Test large number of nested layers with optionals
struct D { a:Int?; }
struct C { d: D; }
struct B { c: C; }
struct A { b: B; }

contract DeepOptionals {
    data: A;
    init() {
        self.data = A{
            b: B{ c: C{ d: D{ a: null } } }
        };
    }
}