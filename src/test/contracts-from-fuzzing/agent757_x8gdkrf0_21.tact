struct D { x: Int; }
struct C { d: D; }
struct B { c: C; }
struct A { b: B; }

contract TestContract {
    persist: A = A{
        b: B{
            c: C{
                d: D{ x: 7 }
            }
        }
    };

    init() {}
}